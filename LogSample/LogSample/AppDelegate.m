//
//  AppDelegate.m
//  LogSample
//
//  Created by Hari Kunwar on 3/15/16.
//  Copyright © 2016 Learning. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self redirectConsoleLogToDocumentFolder];

    return YES;
}

- (void)redirectConsoleLogToDocumentFolder {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *logPath = [documentsDirectory stringByAppendingPathComponent:@"console.txt"];
    freopen([logPath fileSystemRepresentation],"a+",stderr);
}

@end
