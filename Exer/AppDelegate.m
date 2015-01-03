//
//  SYAppDelegate.m
//  Exer
//
//  Created by Sauchye on 14-9-5.
//  Copyright (c) 2014年 Sauchye. All rights reserved.
//

#import "AppDelegate.h"
#import "ACPReminder.h"

@implementation AppDelegate

@synthesize window, navigationController;

- (void)applicationDidFinishLaunching:(UIApplication*)application
{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if (!window)
    {
        return;
    }
   
    navigationController = [[UINavigationController alloc] initWithRootViewController:
                            [[RootViewController alloc] init]];
    navigationController.navigationBar.tintColor = COLOR(2, 100, 162);
    
    [window addSubview:navigationController.view];
    [window makeKeyAndVisible];
    [window layoutSubviews];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    ACPReminder * localNotifications = [ACPReminder sharedManager];
    
    //Settings
    localNotifications.messages = @[@"推送一条离线消息！有空回来看看"];
    localNotifications.timePeriods = @[@(1)]; //days
    localNotifications.appDomain = @"com.mydomain.appName";
    localNotifications.randomMessage = NO; //By default is NO (optional)
    localNotifications.testFlagInSeconds = YES; //By default is NO (optional) --> For testing purpose only!
    localNotifications.circularTimePeriod = YES; // By default is NO (optional)
    
    [localNotifications createLocalNotification];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [[ACPReminder sharedManager] checkIfLocalNotificationHasBeenTriggered];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
