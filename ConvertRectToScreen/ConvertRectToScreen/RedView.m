//
//  ColoredView.m
//  ConvertRectToScreen
//
//  Created by https://devtype.blogspot.com on 1/14/16.
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import "RedView.h"

@implementation RedView

- (void)drawRect:(NSRect)aDirtyRect
{
    [super drawRect:aDirtyRect];
    
    [[NSColor redColor] setFill];
    NSRectFill(aDirtyRect);
}

@end
