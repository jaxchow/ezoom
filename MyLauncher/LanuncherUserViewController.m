//
//  LanuncherUserViewController.m
//  Exer
//
//  Created by jax chow on 12/26/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "LanuncherUserViewController.h"

@interface LanuncherUserViewController ()

@end

@implementation LanuncherUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PAImageView *avaterImageView=[[PAImageView alloc] initWithFrame:CGRectMake(0, 0, 100,100)];
    [avaterImageView setImageURL:@"http://192.168.50.69:8090/images/logo.png"];
    [_avaterImageView addSubview:avaterImageView];
    [_usernameLabel setText:@"jaxchow"];
    [_userGroupNameLabel setText:@"车逸族成员"];
    RKTabItem *mastercardTabItem = [RKTabItem createUsualItemWithImageEnabled:nil imageDisabled:[UIImage imageNamed:@"mastercard"]];
    mastercardTabItem.titleString = @"11";
    
    RKTabItem *paypalTabItem = [RKTabItem createUsualItemWithImageEnabled:nil imageDisabled:[UIImage imageNamed:@"paypal"]];
    paypalTabItem.titleString = @"0";
    RKTabItem *visaTabItem = [RKTabItem createUsualItemWithImageEnabled:nil imageDisabled:[UIImage imageNamed:@"visa"]];
    visaTabItem.titleString = @"1399";
    _titledTabsView.backgroundColor=[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.25f];
    _titledTabsView.drawSeparators=true;
    _titledTabsView.tabItems = @[mastercardTabItem,paypalTabItem,visaTabItem];
    // titledTabsView.darkensBackgroundForEnabledTabs = YES;
    _titledTabsView.horizontalInsets = HorizontalEdgeInsetsMake(25, 25);
    _titledTabsView.titlesFont= [UIFont fontWithName:@"Arial-BoldItalicMT" size:22];
    _titledTabsView.titlesFontColor = [UIColor colorWithWhite:0 alpha:0.8f];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
