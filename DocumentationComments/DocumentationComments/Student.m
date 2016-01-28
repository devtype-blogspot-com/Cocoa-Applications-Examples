//
//  Student.m
//  DocumentationComments
//
//  http://devtype.blogspot.com/2016/01/Kommentarii-dlya-dokumentirovaniya-koda-Objective-C.html
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString *)getStudentName
{
    return _name;
}

- (void)printGrade
{
    NSLog(@"%f", self.grade);
}

@end
