//
//  ViewController.m
//  ezoon
//
//  Created by jax chow on 11/22/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#import "ViewController.h"
#import "MyLauncherItem.h"
#import "CustomBadge.h"
#import "ItemViewController.h"
#import "SettingsViewController.h"
#import "AppSettingsViewController.h"
#import "LeaderboardViewController.h"
#import "CouponViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView
{
    [super loadView];
    [[self appControllers] setObject:[LeaderboardViewController class] forKey:@"LeaderboardViewController"];
    [[self appControllers] setObject:[ItemViewController class] forKey:@"ItemViewController"];
    [[self appControllers] setObject:[SettingsViewController class] forKey:@"SettingsViewController"];
    [[self appControllers] setObject:[AppSettingsViewController class] forKey:@"AppSettingsViewController"];
    [[self appControllers] setObject:[CouponViewController class] forKey:@"CouponViewController"];
    
    if(![self hasSavedLauncherItems])
    {
        [self.launcherView setPages:[NSMutableArray arrayWithObjects:
                                     [NSMutableArray arrayWithObjects:
                                      [[MyLauncherItem alloc] initWithTitle:@"保修比价"
                                                                iPhoneImage:@"itemImage"
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"ItemViewController"
                                                                targetTitle:@"Item 1 View"
                                                                  deletable:NO],
                                      [[MyLauncherItem alloc] initWithTitle:@"车友活动"
                                                                iPhoneImage:@"itemImage"
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"ItemViewController"
                                                                targetTitle:@"Item 2 View"
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
                                                                     target:@"ItemViewController"
                                                                targetTitle:@"Item 4 View"
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
        
        // Set number of immovable items below; only set it when you are setting the pages as the
        // user may still be able to delete these items and setting this then will cause movable
        // items to become immovable.
        // [self.launcherView setNumberOfImmovableItems:1];
        
        // Or uncomment the line below to disable editing (moving/deleting) completely!
        // [self.launcherView setEditingAllowed:NO];
    }
    
    // Set badge text for a MyLauncherItem using it's setBadgeText: method
   // [(MyLauncherItem *)[[[self.launcherView pages] objectAtIndex:0] objectAtIndex:0] setBadgeText:@"4"];
    
    // Alternatively, you can import CustomBadge.h as above and setCustomBadge: as below.
    // This will allow you to change colors, set scale, and remove the shine and/or frame.
    //[(MyLauncherItem *)[[[self.launcherView pages] objectAtIndex:0] objectAtIndex:1] setCustomBadge:[CustomBadge customBadgeWithString:@"2" withStringColor:[UIColor blackColor] withInsetColor:[UIColor whiteColor] withBadgeFrame:YES withBadgeFrameColor:[UIColor blackColor] withScale:0.8 withShining:NO]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    //If you don't want to support multiple orientations uncomment the line below
    //return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
    return [super shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}


@end
