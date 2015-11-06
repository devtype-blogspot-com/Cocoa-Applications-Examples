//
//  AppDelegate.m
//  ReachabilityMac
//  Based on https://developer.apple.com/library/ios/samplecode/Reachability/Introduction/Intro.html
//  Copyright © 2015 Informatik-007. All rights reserved.
//

#import "AppDelegate.h"
#import "Reachability.h"


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (nonatomic, weak) IBOutlet NSTextField* summaryLabel;

@property (nonatomic, weak) IBOutlet NSTextField *remoteHostLabel;
@property (nonatomic, weak) IBOutlet NSImageView *remoteHostImageView;
@property (nonatomic, weak) IBOutlet NSTextField *remoteHostStatusField;

@property (nonatomic, weak) IBOutlet NSImageView *internetConnectionImageView;
@property (nonatomic, weak) IBOutlet NSTextField *internetConnectionStatusField;

@property (nonatomic, weak) IBOutlet NSImageView *localWiFiConnectionImageView;
@property (nonatomic, weak) IBOutlet NSTextField *localWiFiConnectionStatusField;

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;
@property (nonatomic) Reachability *wifiReachability;

@end


@implementation AppDelegate

/*!
 * Called by Reachability whenever status changes.
 */
- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.summaryLabel.hidden = YES;
    
    /*
     Observe the kNetworkReachabilityChangedNotification. 
     When that notification is posted, the method reachabilityChanged will be called.
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    //Change the host name here to change the server you want to monitor.
    NSString *remoteHostName = @"www.apple.com";
    NSString *remoteHostLabelFormatString = NSLocalizedString(@"Remote Host: %@", @"Remote host label format string");
    self.remoteHostLabel.stringValue = [NSString stringWithFormat:remoteHostLabelFormatString, remoteHostName];
    
    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
    [self.hostReachability startNotifier];
    [self updateInterfaceWithReachability:self.hostReachability];
    
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    [self updateInterfaceWithReachability:self.internetReachability];
    
    self.wifiReachability = [Reachability reachabilityForLocalWiFi];
    [self.wifiReachability startNotifier];
    [self updateInterfaceWithReachability:self.wifiReachability];
}

- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    if (reachability == self.hostReachability)
    {
        [self configureTextField:self.remoteHostStatusField
                       imageView:self.remoteHostImageView
                    reachability:reachability];
        NetworkStatus netStatus = [reachability currentReachabilityStatus];
        BOOL connectionRequired = [reachability connectionRequired];
        
        self.summaryLabel.hidden = (netStatus != ReachableViaWWAN);
        NSString* baseLabelText = @"";
        
        if (connectionRequired)
        {
            baseLabelText = NSLocalizedString(@"Cellular data network is available.\nInternet traffic will be routed through it after a connection is established.", @"Reachability text if a connection is required");
        }
        else
        {
            baseLabelText = NSLocalizedString(@"Cellular data network is active.\nInternet traffic will be routed through it.", @"Reachability text if a connection is not required");
        }
        self.summaryLabel.stringValue = baseLabelText;
    }
    
    if (reachability == self.internetReachability)
    {
        [self configureTextField:self.internetConnectionStatusField
                       imageView:self.internetConnectionImageView
                    reachability:reachability];
    }
    
    if (reachability == self.wifiReachability)
    {
        [self configureTextField:self.localWiFiConnectionStatusField
                       imageView:self.localWiFiConnectionImageView
                    reachability:reachability];
    }
}

- (void)configureTextField:(NSTextField *)textField
                 imageView:(NSImageView *)imageView
              reachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    
    switch (netStatus)
    {
        case NotReachable:        {
            statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
            imageView.image = [NSImage imageNamed:@"stop-32"] ;
            /*
             Minor interface detail- connectionRequired may return YES even when the host is unreachable. We cover that up here...
             */
            connectionRequired = NO;
            break;
        }
            
        case ReachableViaWWAN:        {
            statusString = NSLocalizedString(@"Reachable WWAN", @"");
            imageView.image = [NSImage imageNamed:@"WWAN5"];
            break;
        }
        case ReachableViaWiFi:        {
            statusString= NSLocalizedString(@"Reachable WiFi", @"");
            imageView.image = [NSImage imageNamed:@"Airport"];
            break;
        }
    }
    
    if (connectionRequired)
    {
        NSString *connectionRequiredFormatString = NSLocalizedString(@"%@, Connection Required", @"Concatenation of status string with connection requirement");
        statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];
    }
    textField.stringValue= statusString;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kReachabilityChangedNotification
                                                  object:nil];
}

@end
