//
//  AppDelegate.m
//  CocoaApp1
//
//  Copyright (c) 2015 Informatik-007. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSButton *launchApplicationResult;
@property (weak) IBOutlet NSButton *isRunning;
@property (weak) IBOutlet NSButton *runAsync;
@property (weak) IBOutlet NSComboBox *argList;
@property (weak) IBOutlet NSButton *isFakeURL;

@end


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    [self quitCocoaApp2:nil];
}

- (IBAction)launchCocoaApp2:(id)sender {
    [self.launchApplicationResult setState:NSOffState];

    NSWorkspace *theWorkspace = [NSWorkspace sharedWorkspace];
    BOOL theResult = [theWorkspace launchApplication:[self pathToCocoaApp2]];
    if (theResult) {
        [self.launchApplicationResult setState:NSOnState];
    } else {
        [self.launchApplicationResult setState:NSOffState];
    }
}

/**
 @see http://stackoverflow.com/q/12991323/2289640
 */
- (IBAction)launchCocoaApp2WithArgs:(id)sender {
    if (self.runAsync.state == NSOnState) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self launchCocoaApp2WithArgs];
        });
    } else {
        [self launchCocoaApp2WithArgs];
    }
}

- (void)launchCocoaApp2WithArgs
{
    NSWorkspace *theWorkspace = [NSWorkspace sharedWorkspace];
    
    NSURL *theURL;
    if (self.isFakeURL.state == NSOffState) {
        theURL = [NSURL fileURLWithPath:[self pathToCocoaApp2]];
    } else {
        theURL = [NSURL fileURLWithPath:@"/wrong/path"];
    }
    
    NSArray *theArg = [self.argList.stringValue componentsSeparatedByString:@" "];
    NSDictionary *theConf = [NSDictionary dictionaryWithObject:theArg
        forKey:NSWorkspaceLaunchConfigurationArguments];
    NSError *theErr = nil;
    NSRunningApplication *theRunApp = [theWorkspace launchApplicationAtURL:theURL options:0
        configuration:theConf error:&theErr];
    
    if (theRunApp) {
        [self.launchApplicationResult setState:NSOnState];
    } else {
        [self.launchApplicationResult setState:NSOffState];
    }
    
    if (theErr) {
        [self showCriticalAlertWithMessageText:[NSString stringWithFormat:@"ERROR #%ld", [theErr code]]
                               informativeText:[theErr localizedDescription]];
    }
}

- (IBAction)chechCocoaApp2:(id)sender {
    if (self.CocoaApp2) {
        if (self.CocoaApp2.finishedLaunching) {
            [self.isRunning setState:NSOnState];
        }
    } else {
        [self.isRunning setState:NSOffState];
    }
}

/**
 @see http://stackoverflow.com/a/1659189/2289640
 */
- (IBAction)quitApp:(id)sender {
    [NSApp performSelector:@selector(terminate:)
                withObject:nil
                afterDelay:0.0];
}

- (NSRunningApplication *)CocoaApp2 {
    NSString *theBundleId = @"com.github.Informatik-007.CocoaApp2";
    NSArray *theLaunchedApplications =
        [NSRunningApplication runningApplicationsWithBundleIdentifier:theBundleId];
    if (theLaunchedApplications.count > 0) {
        return [theLaunchedApplications firstObject];
    } else {
        return nil;
    }
}

- (NSString *)pathToCocoaApp2 {
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"CocoaApp2" ofType:@"app"];
    return thePath;
}

- (IBAction)quitCocoaApp2:(id)sender {
    if (self.CocoaApp2) {
        if ([self.CocoaApp2 terminate]) {
            [self.isRunning setState:NSOffState];
        } else {
            [self.isRunning setState:NSOnState];
        }
    }
}

- (void)showCriticalAlertWithMessageText:(NSString *)aMessageText
                         informativeText:(NSString *)anInformativeText
{
    NSAlert *theAlert = [[NSAlert alloc] init];
    [theAlert setMessageText:aMessageText];
    [theAlert setInformativeText:anInformativeText];
    [theAlert setAlertStyle:NSCriticalAlertStyle];
    [theAlert runModal];
}

@end
