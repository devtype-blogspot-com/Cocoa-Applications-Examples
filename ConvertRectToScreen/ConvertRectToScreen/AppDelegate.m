//
//  AppDelegate.m
//  ConvertRectToScreen
//
//  Created by https://devtype.blogspot.com on 1/14/16.
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import "AppDelegate.h"
#import "RedView.h"
#import "GreenView.h"
#import "BlueView.h"


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet RedView *redView;
@property (weak) IBOutlet GreenView *greenView;
@property (weak) IBOutlet BlueView *blueView;

@property (strong) NSString *coordinates;

@end


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    [self updInf];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(windowDidMoveOrResize:)
                                                 name:NSWindowDidMoveNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(windowDidMoveOrResize:)
                                                 name:NSWindowDidResizeNotification
                                               object:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:NSWindowDidMoveNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:NSWindowDidResizeNotification
                                                  object:nil];
}

- (IBAction)windowDidMoveOrResize:(NSNotification *)aNotification
{
    [self updInf];
}

- (void)updInf
{
    NSRect theRedRect = [self.window convertRectToScreen:[self.redView frame]];
    NSRect theGreenRect = [self.window convertRectToScreen:[self.greenView frame]];
    NSRect theBlueRect = [self.window convertRectToScreen:[self.blueView frame]];
    
    self.coordinates = [NSString stringWithFormat:@"R: x=%4.0f y=%4.0f w=%4.0f h=%4.0f\nG: x=%4.0f y=%4.0f w=%4.0f h=%4.0f\nB: x=%4.0f y=%4.0f w=%4.0f h=%4.0f"
        , theRedRect.origin.x, theRedRect.origin.y, theRedRect.size.width, theRedRect.size.height
        , theGreenRect.origin.x, theGreenRect.origin.y, theGreenRect.size.width, theGreenRect.size.height
        , theBlueRect.origin.x, theBlueRect.origin.y, theBlueRect.size.width, theBlueRect.size.height
        ];
}

@end
