//
//  CustomWindow.m
//  CanBecomeKeyWindow
//
//  Created by https://devtype.blogspot.com on 1/3/16.
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import "CustomWindow.h"

@implementation CustomWindow

- (void)setKeyWin:(BOOL)aKeyWin
{
    _isKeyWin = aKeyWin;
}

- (BOOL)canBecomeKeyWindow
{
    return self.isKeyWin;
}

@end
