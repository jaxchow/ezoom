//
//  MainProfileView.h
//  ezoon
//
//  Created by zhouhuan on 12/9/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAImageView.h"
#import "RKTabView.h"

@interface MainProfileView : UIView

@property (strong, nonatomic) IBOutlet PAImageView *avaterImageView;
@property (strong, nonatomic) IBOutlet RKTabView *titledTabsView;
@property (strong, nonatomic) IBOutlet UILabel  *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel  *userGroupNameLabel;
@end
