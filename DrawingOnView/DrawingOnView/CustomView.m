//
//  CustomView.m
//  DrawingOnView
//
//  Created by devtype.blogspot.com on 1/5/16.
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/**
 @see http://devtype.blogspot.com/2016/01/Kak-rabotaet-funktsiya-NSInsetRect.html
 */
- (void)testInsetRectWithRect:(NSRect)aDirtyRect
{
    [[NSColor redColor] setFill];
    NSRectFill(aDirtyRect);
    
    float theLineThickness = 50;
    NSRect theContentRect = NSInsetRect([self bounds], theLineThickness, theLineThickness);
    [[NSColor greenColor] setFill];
    NSRectFill(theContentRect);
}

/**
 @see http://devtype.blogspot.com/2016/01/Krivye-Beze-v-Cocoa.html
 */
- (void)testBezierWithRect:(NSRect)aDirtyRect
{
    NSBezierPath *thePath = [NSBezierPath bezierPath];
    [thePath moveToPoint:NSMakePoint(NSMidX(aDirtyRect), NSMaxY(aDirtyRect))];
    
    NSUInteger theArrWidth = 32, theArrHeight = 24;
    [thePath lineToPoint:NSMakePoint(NSMidX(aDirtyRect) + theArrWidth / 2, NSMaxY(aDirtyRect) - theArrHeight)];
    [thePath lineToPoint:NSMakePoint(NSMaxX(aDirtyRect), NSMaxY(aDirtyRect) - theArrHeight)];
    [thePath lineToPoint:NSMakePoint(NSMaxX(aDirtyRect), NSMinY(aDirtyRect))];
    [thePath lineToPoint:NSMakePoint(NSMinX(aDirtyRect), NSMinY(aDirtyRect))];
    [thePath lineToPoint:NSMakePoint(NSMinX(aDirtyRect), NSMaxY(aDirtyRect) - theArrHeight)];
    [thePath lineToPoint:NSMakePoint(NSMidX(aDirtyRect) - theArrWidth / 2, NSMaxY(aDirtyRect) - theArrHeight)];
    
    [thePath closePath];
    
    [[NSColor colorWithDeviceWhite:1.0 alpha:1.0] setFill];
    [thePath fill];
    
    [[NSColor blueColor] setStroke];
    [thePath stroke];
}

- (void)drawRect:(NSRect)aDirtyRect
{
    [super drawRect:aDirtyRect];
    
    [self testBezierWithRect:aDirtyRect];
}

@end
