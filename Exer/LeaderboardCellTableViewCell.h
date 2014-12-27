//
//  LeaderboardCellTableViewCell.h
//  Exer
//
//  Created by jax chow on 12/11/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeaderboardCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userAvatar;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userGroup;
@property (weak, nonatomic) IBOutlet UILabel *weekScore;
@property (weak, nonatomic) IBOutlet UILabel *boardIndex;
@end
