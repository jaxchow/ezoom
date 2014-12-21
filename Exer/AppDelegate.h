//
//  SYAppDelegate.h
//  Exer
//
//  Created by Sauchye on 14-9-5.
//  Copyright (c) 2014年 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "AppPassportViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    UINavigationController *navigationController;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;
@end
