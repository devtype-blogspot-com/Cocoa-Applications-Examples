//
//  WebViewFocusTracker.h
//  WebViewFocusLost
//
//  Copyright (c) 2015 Informatik-007. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

typedef void (^WebViewFocusHandler)(WebView *aWebView, BOOL isFocusLost);

@interface WebViewFocusTracker : NSObject

@property (strong) WebViewFocusHandler focusHandler;

- (id)initWithWebView:(WebView *)aWebView;

@end
