//
//  Circle.h
//  DocumentationComments
//
//  http://devtype.blogspot.com/2016/01/Kommentarii-dlya-dokumentirovaniya-koda-Objective-C.html
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Circle : NSObject

@property NSColor *color;

//! Вычислить площадь 
- (CGFloat)getArea;

@end
