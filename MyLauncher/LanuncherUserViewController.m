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
    NSUserDefaults  *userDefault;
    NSMutableDictionary *settingData;

- (void)loadPortrait {
   userDefault = [NSUserDefaults standardUserDefaults];
    UIImage *protraitImg = [UIImage imageWithData:[userDefault dataForKey:@"avatar"]];
    
    [self.portraitImageView.layer setCornerRadius:(self.portraitImageView.frame.size.height/2)];
    [self.portraitImageView.layer setMasksToBounds:YES];
    [self.portraitImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.portraitImageView setClipsToBounds:YES];
    self.portraitImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.portraitImageView.layer.shadowOffset = CGSizeMake(4, 4);
    self.portraitImageView.layer.shadowOpacity = 0.5;
    self.portraitImageView.layer.shadowRadius = 2.0;
    self.portraitImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.portraitImageView.layer.borderWidth = 3.0f;
    self.portraitImageView.userInteractionEnabled = YES;
    self.portraitImageView.backgroundColor = [UIColor blackColor];
    [self.portraitImageView setImage:protraitImg];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadPortrait];
    [_usernameLabel setText:[userDefault stringForKey:@"nickname"]];
    [_userGroupNameLabel setText:[userDefault stringForKey:@"usergrouptext"]];
  

    RKTabItem *mastercardTabItem = [RKTabItem createUsualItemWithImageEnabled:nil imageDisabled:[UIImage imageNamed:@"mastercard"]];
    mastercardTabItem.titleString = @"优惠券 \n11";
    
    RKTabItem *paypalTabItem = [RKTabItem createUsualItemWithImageEnabled:nil imageDisabled:[UIImage imageNamed:@"paypal"]];
    paypalTabItem.titleString = @"活动 \n0";
    RKTabItem *visaTabItem = [RKTabItem createUsualItemWithImageEnabled:nil imageDisabled:[UIImage imageNamed:@"visa"]];
    visaTabItem.titleString =[NSString stringWithFormat:@"积分 \n %@",[userDefault stringForKey:@"userscore"]];
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

@end
