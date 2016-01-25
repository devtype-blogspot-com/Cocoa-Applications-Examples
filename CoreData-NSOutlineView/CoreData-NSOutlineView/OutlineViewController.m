//
//  OutlineViewController.m
//  CoreData-NSOutlineView
//
//  http://devtype.blogspot.com/2016/01/Ispolzovanie-NSOutlineView-i-Core-Data.html
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import "OutlineViewController.h"

@implementation OutlineViewController

- (void)awakeFromNib {
    dragType = [NSArray arrayWithObjects: @"factorialDragType", nil];
    [ myOutlineView registerForDraggedTypes:dragType ];
    NSSortDescriptor* sortDesc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [treeController setSortDescriptors:[NSArray arrayWithObject: sortDesc]];
}

- (BOOL) outlineView : (NSOutlineView *) outlineView
          writeItems : (NSArray*) items
        toPasteboard : (NSPasteboard*) pboard {
    [ pboard declareTypes:dragType owner:self ];
    draggedNode = [ items objectAtIndex:0 ];
    return YES;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView
         acceptDrop:(id <NSDraggingInfo>)info
               item:(id)item
         childIndex:(NSInteger)index {
    NSManagedObject* draggedTreeNode = [ draggedNode representedObject ];
    [ draggedTreeNode setValue:[item representedObject ] forKey:@"parent" ];
    return YES;
}

- (BOOL) category:(NSManagedObject* )cat
  isSubCategoryOf:(NSManagedObject* )possibleSub {
    // Depends on your interpretation of subCategory ....
    if ( cat == possibleSub ) {
        return YES;
    }
    NSManagedObject* possSubParent = [possibleSub valueForKey:@"parent"];
    if ( possSubParent == NULL ) {
        return NO;
    }
    
    while ( possSubParent != NULL ) {
        if ( possSubParent == cat ) {
            return YES;
        }
        // move up the tree
        possSubParent = [possSubParent valueForKey:@"parent"];
    }
    
    return NO;
}

// This method gets called by the framework but
// the values from bindings are used instead
- (id)outlineView:(NSOutlineView *)outlineView
objectValueForTableColumn:(NSTableColumn *)tableColumn
           byItem:(id)item {
    return NULL;
}

- (NSDragOperation)outlineView:(NSOutlineView *)outlineView
                  validateDrop:(id <NSDraggingInfo>)info
                  proposedItem:(id)item
            proposedChildIndex:(NSInteger)index {
    // drags to the root are always acceptable
    if ( [item representedObject] == NULL ) {
        return NSDragOperationGeneric;
    }
    // Verify that we are not dragging a parent to one of it's ancestors
    // causes a parent loop where a group of nodes point to each other
    // and disappear from the control
    NSManagedObject* dragged = [ draggedNode representedObject ];
    NSManagedObject* newP = [ item representedObject ];
    if ( [ self category:dragged isSubCategoryOf:newP ] ) {
        return NO;
    }
    return NSDragOperationGeneric;
}

/* The following are implemented as stubs because they are
 required when implementing an NSOutlineViewDataSource.
 Because we use bindings on the table column these methods are never called.
 The NSLog statements have been included to prove that these methods are not called. */
- (NSInteger)outlineView:(NSOutlineView *)outlineView
  numberOfChildrenOfItem:(id)item {
    NSLog(@"numberOfChildrenOfItem");
    return 1;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView
   isItemExpandable:(id)item {
    NSLog(@"isItemExpandable");
    return YES;
}

- (id)outlineView:(NSOutlineView *)outlineView
            child:(NSInteger)index
           ofItem:(id)item {
    NSLog(@"child of Item");
    return NULL;
}

@end
