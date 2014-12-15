//
//  CouponDetailViewController.m
//  Exer
//
//  Created by jax chow on 12/15/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "CouponDetailViewController.h"
#import "ASIHTTPRequest.h";
#import "NSString+SBJSON.h"
#import "UIImageView+WebCache.h"

@interface CouponDetailViewController ()<ASIHTTPRequestDelegate>

@end

@implementation CouponDetailViewController


- (id)initWithKey:(NSString*)key{
   
    self.title=key;
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    request.delegate = self;
    //异步发送请求
    [request startSynchronous];
    return self;
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSDictionary *jsonDict = [request.responseString  JSONValue];
    
    NSArray *movieArray = jsonDict[@"subjects"];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"请求失败");
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
