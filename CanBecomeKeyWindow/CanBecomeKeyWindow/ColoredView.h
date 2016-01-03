//
//  ColoredView.h
//  CanBecomeKeyWindow
//
//  Created by https://devtype.blogspot.com on 1/3/16.
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ColoredView : NSView

@property (strong) NSColor *color;

- (id)initWithColor:(NSColor *)aColor;

@end
