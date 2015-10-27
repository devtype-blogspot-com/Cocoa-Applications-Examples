//
//  main.m
//  CocoaApp2
//
//  Created by Abbas on 10/27/15.
//  Copyright (c) 2015 Informatik-007. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "InputManager.h"

int main(int argc, const char * argv[]) {
    
    printf("argc = %d\n", argc);
    for (int i = 0; i < argc; i++) {
        printf("argv[%d] = %s\n", i, argv[i]);
        
        if (strcmp(argv[i], "-delay") == 0) {
            if (i + 1 < argc) {
                int theWait = atoi(argv[i + 1]);
                [[InputManager sharedManager] setDelay:theWait];
                
                printf("sleep(%d);\n", theWait);
                sleep(theWait);

            } else {
                printf("bad argument '%s'\n", argv[i]);
                exit(0);
            }
        } else if (strcmp(argv[i], "-exit") == 0) {
            if (i + 1 < argc) {
                int theExitCode = atoi(argv[i + 1]);
                exit(theExitCode);
            } else {
                printf("bad argument '%s'\n", argv[i]);
                exit(0);
            }
        }
    }
    
    return NSApplicationMain(argc, argv);
}
