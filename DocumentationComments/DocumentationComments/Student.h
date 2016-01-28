//
//  Student.h
//  DocumentationComments
//
//  http://devtype.blogspot.com/2016/01/Kommentarii-dlya-dokumentirovaniya-koda-Objective-C.html
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic) NSString *name;
@property CGFloat grade;

/// @description Вывести оценку.
- (void)printGrade;

/*! 
 <tt>Этот текст не будет жирным.</tt>
 
 @return Returns an @c NSString or @c nil.
 */
- (NSString *)getStudentName;

@end
