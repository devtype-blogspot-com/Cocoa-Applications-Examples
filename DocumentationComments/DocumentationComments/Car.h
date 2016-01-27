//
//  Car.h
//  DocumentationComments
//
//  http://devtype.blogspot.com/2016/01/Kommentarii-dlya-dokumentirovaniya-koda-Objective-C.html
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

/**
 @description Передвигает автомобиль.
 @available Версия 1.0 до 2.2
 */
- (void)moveAtLocation:(CGPoint)aLocation;

- (void)park;
- (void)accelerate;

@end
