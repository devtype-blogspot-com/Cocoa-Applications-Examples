//
//  AppDelegate.m
//  DocumentationComments
//
//  http://devtype.blogspot.com/2016/01/Kommentarii-dlya-dokumentirovaniya-koda-Objective-C.html
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
#import "Car.h"
#import "Circle.h"
#import "SoccerPlayer.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    Student *theStudent = [Student new];
    [theStudent printGrade];
    
    Car *theCar = [Car new];
    [theCar moveAtLocation:NSZeroPoint];
    
    Circle *theCircle = [Circle new];
    [theCircle getArea];
    
    SoccerPlayer *theSoccerPlayer = [SoccerPlayer new];
    [theSoccerPlayer kickBall:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
