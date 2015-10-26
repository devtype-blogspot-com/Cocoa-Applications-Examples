//
//  WebView+Extra.m
//  WebViewFocusLost
//
//  Copyright (c) 2015 Informatik-007. All rights reserved.
//

#import "WebView+Extra.h"

@implementation WebView (Extra)

- (NSControl *)webHTMLView
{
    WebFrameView *theWebFrameView = [[self mainFrame] frameView];
    assert(theWebFrameView != nil && [theWebFrameView isKindOfClass:[WebFrameView class]]);
    
    NSScrollView *theWebDynamicScrollBarsView = [[theWebFrameView subviews] firstObject];
    assert(theWebDynamicScrollBarsView != nil && [theWebDynamicScrollBarsView isKindOfClass:[NSScrollView class]]);
    
    NSClipView *theWebClipView = [[theWebDynamicScrollBarsView subviews] firstObject];
    assert(theWebClipView != nil && [theWebClipView isKindOfClass:[NSClipView class]]);
    
    NSControl *theWebHTMLView = [theWebClipView documentView];
    assert(theWebHTMLView != nil && [theWebHTMLView isKindOfClass:[NSControl class]]);
    
    return theWebHTMLView;
}

@end
