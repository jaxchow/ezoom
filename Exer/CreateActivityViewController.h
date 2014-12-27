//
//  CreateActivityViewController.h
//  ezoom
//
//  Created by jax chow on 12/26/14.
//  Copyright (c) 2014 JaxTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RETableViewManager.h"

@interface CreateActivityViewController : UIViewController<RETableViewManagerDelegate>

@property (strong, readonly, nonatomic) RETableViewManager *manager;
@property (strong, readwrite, nonatomic) IBOutlet UITableView *tableView;

@end
