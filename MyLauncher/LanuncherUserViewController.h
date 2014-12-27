//
//  LanuncherUserViewController.h
//  Exer
//
//  Created by jax chow on 12/26/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAImageView.h"
#import "RKTabView.h"


@interface LanuncherUserViewController : UIViewController


@property (strong, nonatomic) IBOutlet PAImageView *avaterImageView;
@property (strong, nonatomic) IBOutlet RKTabView *titledTabsView;
@property (strong, nonatomic) IBOutlet UILabel  *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel  *userGroupNameLabel;

@end
