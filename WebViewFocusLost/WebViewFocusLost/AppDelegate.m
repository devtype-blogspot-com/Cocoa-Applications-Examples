//
//  AppDelegate.m
//  WebViewFocusLost
//
//  Copyright (c) 2015 Informatik-007. All rights reserved.
//

@import WebKit;

#import "AppDelegate.h"
#import "WebView+Extra.h"
#import "WebViewFocusTracker.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet WebView *webView;
@property (weak) IBOutlet NSButton *openBtn;
@property (weak) IBOutlet NSTextField *addrTextField;

@property (strong) WebViewFocusTracker *webViewFocusTracker;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self.webView setEditingDelegate:self];
    [self.webView setFrameLoadDelegate:self];
    
    _webViewFocusTracker = [[WebViewFocusTracker alloc] initWithWebView:self.webView];
    [_webViewFocusTracker setFocusHandler:^void(WebView *aWebView, BOOL isFocusLost) {
        if (isFocusLost) {
            NSLog(@"WebView lost the focus!");
        } else {
            NSLog(@"WebView get the focus!");
        }
    }];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
}

- (IBAction)openBtnClick:(id)sender {
    NSString *theURLStr = [self.addrTextField stringValue];
    NSURL *theURL = [NSURL URLWithString:theURLStr];
    NSURLRequest *theReq = [NSURLRequest requestWithURL:theURL];
    [[self.webView mainFrame] loadRequest:theReq];
}

#pragma mark - WebViewEditingDelegate 
// https://developer.apple.com/library/mac/documentation/Cocoa/Reference/WebKit/Protocols/WebEditingDelegate_Protocol/

/**
 @see http://stackoverflow.com/q/18671099/2289640
 */
- (void)webViewDidEndEditing:(NSNotification *)aNotification {
    // NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)webViewDidChange:(NSNotification *)aNotification {
    // NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - WebFrameLoadDelegate

/**
 @see http://stackoverflow.com/a/10674055/2289640
 */
- (void)webView:(WebView *)aSender didFinishLoadForFrame:(WebFrame *)aFrame {
    // NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
