//
//  CustomView.m
//  DrawingOnView
//
//  Created by devtype.blogspot.com on 1/5/16.
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)testInsetRectWithRect:(NSRect)aDirtyRect
{
    [[NSColor redColor] setFill];
    NSRectFill(aDirtyRect);
    
    float theLineThickness = 50;
    NSRect theContentRect = NSInsetRect([self bounds], theLineThickness, theLineThickness);
    [[NSColor greenColor] setFill];
    NSRectFill(theContentRect);
}

- (void)drawRect:(NSRect)aDirtyRect
{
    [super drawRect:aDirtyRect];
    
    [self testInsetRectWithRect:aDirtyRect];
}

@end
