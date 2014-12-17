//
//  ScoreViewController.h
//  Exer
//
//  Created by jax chow on 12/17/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreViewController : UIViewController<UITableViewDelegate>

@property(strong, readwrite,nonatomic) UITableView *_tableView;
@property(strong, readwrite,nonatomic) UIView *_scoreView;

@end
