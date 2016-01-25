//
//  OutlineViewController.h
//  CoreData-NSOutlineView
//
//  http://devtype.blogspot.com/2016/01/Ispolzovanie-NSOutlineView-i-Core-Data.html
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OutlineViewController : NSObject <NSOutlineViewDataSource> {
    IBOutlet NSTreeController *treeController;
    IBOutlet NSOutlineView    *myOutlineView;
    NSArray     *dragType;
    NSTreeNode  *draggedNode;
}
@end
