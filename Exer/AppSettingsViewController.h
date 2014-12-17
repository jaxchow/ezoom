//
//  AppSettingsViewController.h
//  Exer
//
//  Created by jax chow on 12/15/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IASKAppSettingsViewController.h"
#import "RETableViewManager.h"

@interface AppSettingsViewController : UITableViewController <RETableViewManagerDelegate>{
}

@property (strong, readonly, nonatomic) RETableViewManager *manager;
@property (strong, readwrite, nonatomic) RETableViewSection *accountSection;
@property (strong, readwrite, nonatomic) RETableViewSection *profileSection;
@property (strong, readwrite, nonatomic) RETableViewSection *serviceSection;
@property (strong, readwrite, nonatomic) RETableViewSection *buttomSection;

-(void) openView;
@end
