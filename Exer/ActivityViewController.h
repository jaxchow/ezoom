//
//  ActivityViewController.h
//  Exer
//
//  Created by jax chow on 12/24/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityViewController : UIViewController
-(void) openView;
@property(nonatomic, strong, readonly) IBOutlet UITableView *tableView;
@end
