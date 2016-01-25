//
//  AppDelegate.h
//  CoreData-NSOutlineView
//
//  http://devtype.blogspot.com/2016/01/Ispolzovanie-NSOutlineView-i-Core-Data.html
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak) IBOutlet NSArrayController *arrCtrl;
@property (weak) IBOutlet NSTreeController *treeCtrl;

@end

