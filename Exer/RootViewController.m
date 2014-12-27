//
//  ViewController.m
//  ezoom
//
//  Created by jax chow on 12/11/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#import "RootViewController.h"
#import "MyLauncherItem.h"
#import "CustomBadge.h"
#import "ItemViewController.h"
#import "CouponViewController.h"
#import "LeaderboardViewController.h"
#import "AppSettingsViewController.h"
#import "MaintenanceViewController.h"
#import "ActivityViewController.h"
#import "CreateActivityViewController.h"
#import "AppPassportViewController.h"
@interface RootViewController ()
            

@end

@implementation RootViewController

-(void)loadView
{
    [super loadView];
    [[self appControllers] setObject:[ItemViewController class] forKey:@"ItemViewController"];
    [[self appControllers] setObject:[CouponViewController class] forKey:@"CouponViewController"];
    [[self appControllers] setObject:[LeaderboardViewController class] forKey:@"LeaderboardViewController"];
    [[self appControllers] setObject:[AppSettingsViewController class] forKey:@"AppSettingsViewController"];
    [[self appControllers] setObject:[MaintenanceViewController class] forKey:@"MaintenanceViewController"];
    [[self appControllers] setObject:[ActivityViewController class] forKey:@"ActivityViewController"];
    [[self appControllers] setObject:[CreateActivityViewController class] forKey:@"CreateActivityViewController"];
    
    if(![self hasSavedLauncherItems])
    {
        [self.launcherView setPages:[NSMutableArray arrayWithObjects:
                                     [NSMutableArray arrayWithObjects:
                                      [[MyLauncherItem alloc] initWithTitle:@"保修比价"
                                                                iPhoneImage:@"itemImage"
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"MaintenanceViewController"
                                                                targetTitle:@"保修比价"
                                                                  deletable:NO],
                                      [[MyLauncherItem alloc] initWithTitle:@"车友活动"
                                                                iPhoneImage:@"itemImage"
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"ActivityViewController"
                                                                targetTitle:@"车友活动"
                                                                  deletable:NO],
                                      [[MyLauncherItem alloc] initWithTitle:@"积分对兑"
                                                                iPhoneImage:@"itemImage"
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"CouponViewController"
                                                                targetTitle:@"积分对兑"
                                                                  deletable:NO],
                                      [[MyLauncherItem alloc] initWithTitle:@"我的车圈"
                                                                iPhoneImage:@"itemImage"
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"CreateActivityViewController"
                                                                targetTitle:@"我的车圈"
                                                                  deletable:NO],
                                      [[MyLauncherItem alloc] initWithTitle:@"个人设置"
                                                                iPhoneImage:@"itemImage"
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"AppSettingsViewController"
                                                                targetTitle:@"个人设置"
                                                                  deletable:NO],
                                      [[MyLauncherItem alloc] initWithTitle:@"排行榜"
                                                                iPhoneImage:@"itemImage"
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"LeaderboardViewController"
                                                                targetTitle:@"排行榜"
                                                                  deletable:NO],
                                      nil], nil]];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    //If you don't want to support multiple orientations uncomment the line below
    //return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
    return [super shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}
- (void)viewDidLoad {
   // self.launcherNavigationController.toolbarHidden=TRUE;
  //  [self.navigationController presentModalViewController:[[AppPassportViewController alloc] init] animated:true];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
