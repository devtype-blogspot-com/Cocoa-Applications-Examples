//
//  ColoredView.m
//  CanBecomeKeyWindow
//
//  Created by https://devtype.blogspot.com on 1/3/16.
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import "ColoredView.h"

@implementation ColoredView {
    NSTextField *textField;
}

- (id)initWithColor:(NSColor *)aColor
{
    self = [self init];
    if (self) {
        _color = aColor;
        
        textField = [[NSTextField alloc] initWithFrame:NSMakeRect(10, 10, 96, 22)];
        [self addSubview:textField];
    }
    return self;
}

- (void)drawRect:(NSRect)aDirtyRect
{
    [super drawRect:aDirtyRect];
    
    [self.color setFill];
    NSRectFill(aDirtyRect);
}

@end
