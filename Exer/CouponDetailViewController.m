//
//  CouponDetailViewController.m
//  Exer
//
//  Created by jax chow on 12/15/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "CouponDetailViewController.h"
#import "UIImageView+WebCache.h"
#import "ActivityModel.h"

@interface CouponDetailViewController ()
{
     ActivityModel  *_model;
}
@end


@implementation CouponDetailViewController


- (id)initWithModel:(ActivityModel*)model{
    self.title=model.title;
    _model=model;
    return self;
}


- (void)viewDidLoad {
    //_model.title
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
