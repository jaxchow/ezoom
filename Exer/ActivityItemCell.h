//
//  SYCell.h
//  Exer
//
//  Created by Sauchye on 14-9-5.
//  Copyright (c) 2014年 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *activityImg;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *payText;
@property (weak, nonatomic) IBOutlet UILabel *cost;
@property (strong, nonatomic) IBOutlet UIButton *joinButton;
-(IBAction)join:(id)sender;
@end

