//
//  MaintenanceViewController.h
//  Exer
//
//  Created by jax chow on 12/24/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MaintenanceViewController : UIViewController
-(void) openView;
@property(nonatomic, strong, readonly) UITableView *tableView;
-(IBAction)detailHandler:(id)sender;
@end
