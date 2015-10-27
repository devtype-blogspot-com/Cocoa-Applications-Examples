//
//  AppDelegate.m
//  CocoaApp2
//
//  Copyright (c) 2015 Informatik-007. All rights reserved.
//

#import "AppDelegate.h"
#import "InputManager.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *delayLabel;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    int theDelay = [[InputManager sharedManager] delay];
    self.delayLabel.stringValue = [NSString stringWithFormat:@"Delay = %d"
        , theDelay];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)quitApp:(id)sender {
    [NSApp performSelector:@selector(terminate:)
                withObject:nil
                afterDelay:0.0];
}

@end
