//
//  WebViewFocusTracker.m
//  WebViewFocusLost
//
//  Copyright (c) 2015 Informatik-007. All rights reserved.
//

#import "WebViewFocusTracker.h"
#import "WebView+Extra.h"


@interface WebViewFocusTracker()

@property (strong) WebView *webView;

@end


@implementation WebViewFocusTracker

- (id)initWithWebView:(WebView *)aWebView {
    NSParameterAssert(aWebView);

    self = [self init];
    if (self) {
        _webView = aWebView;
        [self registerAsObserver];
    }
    return self;
}

/**
 You can do this in 10.6 and later by using KVO to observe the window's firstResponder.
 It will change when the focused control in the window changes.
 
 @see http://stackoverflow.com/a/16270630/2289640
 */
- (void)registerAsObserver {
    [self.webView.window addObserver:self
                          forKeyPath:@"firstResponder"
                             options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                             context:NULL];
}

#pragma mark - NSObject

- (void)dealloc {
    [self.webView.window removeObserver:self
                             forKeyPath:@"firstResponder"];
}

#pragma mark - NSKeyValueObserving

/**
 @see https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Protocols/NSKeyValueObserving_Protocol/
 */
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqual:@"firstResponder"]) {
        id theOld = [change objectForKey:NSKeyValueChangeOldKey];
        if (theOld == [self.webView webHTMLView]) {
            if (self.focusHandler) {
                self.focusHandler(self.webView, YES);
            }
        }
        
        id theNew = [change objectForKey:NSKeyValueChangeNewKey];
        if (theNew == [self.webView webHTMLView]) {
            if (self.focusHandler) {
                self.focusHandler(self.webView, NO);
            }
        }
    }
}

@end
