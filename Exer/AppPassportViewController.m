//
//  AppPassportViewController.m
//  Exer
//
//  Created by jax chow on 12/19/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//
#define movieURL  @"http://localhost:8080/cms/mobile/login.do"

#import "AppPassportViewController.h"
#import "RootViewController.h"
#import "ASIHTTPRequest.h"
#import "NSString+SBJSON.h"
#import "ASIFormDataRequest.h"

@interface AppPassportViewController ()<ASIHTTPRequestDelegate>

@end

@implementation AppPassportViewController

- (void)viewDidLoad {
    //[self. initWithTitle:@"积分规则" style:UIBarButtonItemStyleBordered target:self action:@selector(showScoreRules:)];
    [self.submitButton addTarget:self action:@selector(submitLogin:) forControlEvents:UIControlEventTouchDown];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)submitLogin:(id)sender{
    ASIFormDataRequest *httpRequest=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:movieURL]];
   // [httpRequest a]
//    [httpRequest setRequestMethod:@"POST"];
//    [httpRequest setPostValue:self.userField.text forKey:@"username"];
//    [httpRequest setPostValue:self.passField.text forKey:@"password"];
//    [httpRequest startSynchronous];
//    
//    NSError *error = [httpRequest error];
//    if (!error) {
//        NSDictionary *jsonDict = [httpRequest.responseString  JSONValue];
//        NSLog(@"msg %s is %s",jsonDict[@"msg"],jsonDict[@"username"]);
//    }
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
