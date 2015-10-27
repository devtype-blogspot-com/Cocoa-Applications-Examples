//
//  InputManager.m
//  CocoaApp2
//
//  Copyright (c) 2015 Informatik-007. All rights reserved.
//

#import "InputManager.h"

@implementation InputManager

@synthesize delay;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static InputManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        delay = 0;
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
