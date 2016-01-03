//
//  AppDelegate.m
//  CanBecomeKeyWindow
//
//  Created by https://devtype.blogspot.com on 1/3/16.
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomWindow.h"
#import "ColoredView.h"


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSButton *borderlessWindowMask;
@property (weak) IBOutlet NSButton *titledWindowMask;
@property (weak) IBOutlet NSButton *closableWindowMask;
@property (weak) IBOutlet NSButton *miniaturizableWindowMask;
@property (weak) IBOutlet NSButton *resizableWindowMask;
@property (weak) IBOutlet NSButton *texturedBackgroundWindowMask;
@property (weak) IBOutlet NSButton *unifiedTitleAndToolbarWindowMask;
@property (weak) IBOutlet NSButton *fullScreenWindowMask;
@property (weak) IBOutlet NSButton *fullSizeContentViewWindowMask;

@property (weak) IBOutlet NSButton *canBecomeKeyWin;

@property (weak) IBOutlet NSTextField *winX;
@property (weak) IBOutlet NSTextField *winY;
@property (weak) IBOutlet NSTextField *winWidth;
@property (weak) IBOutlet NSTextField *winHeight;

@end


@implementation AppDelegate {
    NSWindowController *winCtrl;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSUInteger)styleMask
{
    NSUInteger theStyleMask = 0;
    if (self.borderlessWindowMask.state == NSOnState) theStyleMask |= NSBorderlessWindowMask;
    if (self.titledWindowMask.state == NSOnState) theStyleMask |= NSTitledWindowMask;
    if (self.closableWindowMask.state == NSOnState) theStyleMask |= NSClosableWindowMask;
    if (self.miniaturizableWindowMask.state == NSOnState) theStyleMask |= NSMiniaturizableWindowMask;
    if (self.resizableWindowMask.state == NSOnState) theStyleMask |= NSResizableWindowMask;
    if (self.texturedBackgroundWindowMask.state == NSOnState) theStyleMask |= NSTexturedBackgroundWindowMask;
    if (self.unifiedTitleAndToolbarWindowMask.state == NSOnState) theStyleMask |= NSUnifiedTitleAndToolbarWindowMask;
    if (self.fullScreenWindowMask.state == NSOnState) theStyleMask |= NSFullScreenWindowMask;
    if (self.fullSizeContentViewWindowMask.state == NSOnState) theStyleMask |= NSFullSizeContentViewWindowMask;
    return theStyleMask;
}

- (CustomWindow *)customWindow
{
    NSRect theRect = NSMakeRect([self.winX.stringValue intValue], [self.winY.stringValue intValue]
        , [self.winWidth.stringValue intValue], [self.winHeight.stringValue intValue]);
    CustomWindow *theWin  = [[CustomWindow alloc] initWithContentRect:theRect
                                                            styleMask:[self styleMask]
                                                              backing:NSBackingStoreBuffered
                                                                defer:NO];
    [theWin setBackgroundColor:[NSColor colorWithCalibratedWhite:1.0
                                                           alpha:0.0]];
    [theWin setOpaque:NO];
//    [theWin makeKeyAndOrderFront:NSApp];
    [theWin setContentView:[[ColoredView alloc] initWithColor:[NSColor blackColor]]];
    
    [theWin setKeyWin:self.canBecomeKeyWin.state == NSOnState ? YES : NO];

    return theWin;
}

- (IBAction)foo:(id)sender
{
    winCtrl = [[NSWindowController alloc] initWithWindow:[self customWindow]];
    [winCtrl showWindow:nil];
}

- (IBAction)closeWin:(id)sender
{
    [winCtrl close];
}

@end
