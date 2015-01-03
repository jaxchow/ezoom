//
//  ProfileViewController.h
//  Exer
//
//  Created by jax chow on 12/17/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RETableViewManager.h"

@interface ProfileViewController : UITableViewController<RETableViewManagerDelegate>
    @property (strong, readonly, nonatomic) RETableViewManager *manager;
@end
