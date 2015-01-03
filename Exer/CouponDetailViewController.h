//
//  CouponDetailViewController.h
//  Exer
//
//  Created by jax chow on 12/15/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"
#import "ASIHTTPRequestDelegate.h"

@interface CouponDetailViewController : UIViewController<UIAlertViewDelegate,ASIHTTPRequestDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *activityImg;
@property (weak, nonatomic) IBOutlet UILabel *payText;
@property (weak, nonatomic) IBOutlet UILabel *cost;
@property (weak, nonatomic) IBOutlet UITextView *desc;
@property (weak, nonatomic) IBOutlet UILabel *endDate;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UIButton *joinButton;
-(void)join:(id)sender;
- (id)initWithModel:(ActivityModel*)model;
-(void)payAction:(ActivityModel *)model;
@end

