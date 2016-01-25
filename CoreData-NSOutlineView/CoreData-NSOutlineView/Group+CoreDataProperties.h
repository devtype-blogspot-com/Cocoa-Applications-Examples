//
//  Group+CoreDataProperties.h
//  CoreData-NSOutlineView
//
//  http://devtype.blogspot.com/2016/01/Ispolzovanie-NSOutlineView-i-Core-Data.html
//  Copyright © 2016 DEVTYPE. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "Group.h"

NS_ASSUME_NONNULL_BEGIN

@interface Group (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Group *parent;
@property (nullable, nonatomic, retain) NSSet<Group *> *subGroups;

@end

@interface Group (CoreDataGeneratedAccessors)

- (void)addSubGroupsObject:(Group *)value;
- (void)removeSubGroupsObject:(Group *)value;
- (void)addSubGroups:(NSSet<Group *> *)values;
- (void)removeSubGroups:(NSSet<Group *> *)values;

@end

NS_ASSUME_NONNULL_END
