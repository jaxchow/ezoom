//
//  MaintenanceDetailViewController.m
//  Exer
//
//  Created by jax chow on 12/24/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "MaintenanceDetailViewController.h"

@interface MaintenanceDetailViewController ()

@end

@implementation MaintenanceDetailViewController

- (id)initWithKey:(NSString*)key{
    
    self.title=key;
  //  ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:DOMAIN_CONTEXT(@"/cms/mobile/coupom/getCoupom.jspx?key=9")];
  //  request.delegate = self;
    //异步发送请求
  //  [request startSynchronous];
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
