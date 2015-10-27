//
//  AppDelegate.m
//  NSUserNotification
//
//  Copyright (c) 2015 Informatik-007. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

/**
 @see http://cocoathings.blogspot.com/2013/01/introduction-to-user-notifications-in.html
 */
- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center
     shouldPresentNotification:(NSUserNotification *)notification
{
    return YES;
}

- (IBAction)showUserNotification:(id)sender
{
    NSUserNotification *notification = [[NSUserNotification alloc] init];
    notification.title = @"File Uploaded";
    notification.subtitle = @"example.txt";
    notification.informativeText = [NSString stringWithFormat:@"/Users/John/Documents/example.txt"];
    notification.soundName = NSUserNotificationDefaultSoundName;
    notification.contentImage = [NSImage imageNamed:@"icon_Upload-Information-icon_24x24"];
    
    [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];
}

@end
