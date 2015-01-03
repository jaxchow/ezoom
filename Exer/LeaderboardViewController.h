//
//  LeaderboardViewController.h
//  ezoon
//
//  Created by jax chow on 11/23/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemViewController.h"
@interface LeaderboardViewController : UIViewController{
  NSArray* segmentControlTitles;
}
-(void) openView;
@property(nonatomic, strong, readonly) UITableView *tableView;
@end
