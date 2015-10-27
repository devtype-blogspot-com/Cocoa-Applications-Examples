//
//  InputManager.h
//  CocoaApp2
//
//  Copyright (c) 2015 Informatik-007. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputManager : NSObject {
    int delay;
}

@property int delay;

+ (id)sharedManager;

@end
