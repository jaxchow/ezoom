//
//  RETableViewUISegmentedCell.h
//  Exer
//
//  Created by jax chow on 12/25/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RETableViewCell.h"
#import "RESegmentedItem.h"
@interface RETableViewSegmentedCell : RETableViewCell

@property (strong, readonly, nonatomic) UISegmentedControl *switchView;
@property (strong, readwrite, nonatomic) RESegmentedItem *item;

@end
