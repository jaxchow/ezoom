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
#import "AppPassportViewController.h"
#import "FeedbackViewController.h"
#import "AFHTTPRequestOperation.h"



@interface RootViewController ()
            

@end

@implementation RootViewController
-(id)init {
    //[self.navigationController setNavigationBarHidden:TRUE];
    //self.navigationController.navigationBar.translucent=NO;
 
    NSURLRequest *request = [NSURLRequest requestWithURL:DOMAIN_URL(@"/mobile/user/userinfo.jspx")];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", operation.responseString);
        
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        //系统自带JSON解析
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
    }];
    [operation start];
    return self;
}
-(void)loadView
{
    [super loadView];
    [[self appControllers] setObject:[ItemViewController class] forKey:@"ItemViewController"];
    [[self appControllers] setObject:[CouponViewController class] forKey:@"CouponViewController"];
    [[self appControllers] setObject:[LeaderboardViewController class] forKey:@"LeaderboardViewController"];
    [[self appControllers] setObject:[AppSettingsViewController class] forKey:@"AppSettingsViewController"];
    [[self appControllers] setObject:[MaintenanceViewController class] forKey:@"MaintenanceViewController"];
    [[self appControllers] setObject:[ActivityViewController class] forKey:@"ActivityViewController"];
    [[self appControllers] setObject:[FeedbackViewController class] forKey:@"FeedbackViewController"];
    
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
                                      [[MyLauncherItem alloc] initWithTitle:@"建议反馈"
                                                                iPhoneImage:@"itemImage"
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"FeedbackViewController"
                                                                targetTitle:@"建议反馈"
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
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
