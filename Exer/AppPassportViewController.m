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
 NSMutableDictionary *settingData;

//- (void) readPlistSettings{
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"AppSettings" ofType:@"plist"];
//    settingData = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
//    
//
//}
-(void) writePlistSetting:(NSMutableDictionary *)settingData{
    
        NSString *fileName=[[NSBundle mainBundle] pathForResource:@"AppSettings" ofType:@"plist"];
    
        //创建并写入文件
        [settingData writeToFile:fileName atomically:YES];
}

- (void)viewDidLoad {
    [self.submitButton addTarget:self action:@selector(submitLogin:) forControlEvents:UIControlEventTouchDown];
    [super viewDidLoad];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    // Do any additional setup after loading the view from its nib.
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.userField resignFirstResponder];
    [self.passField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)submitLogin:(id)sender{
    ASIFormDataRequest *httpRequest=[ASIFormDataRequest requestWithURL:DOMAIN_CONTEXT(@"/cms/mobile/login.do")];
    [httpRequest addPostValue:self.userField.text forKey:@"username"];
    [httpRequest addPostValue:self.passField.text forKey:@"password"];
    [httpRequest startSynchronous];
    NSError *error = [httpRequest error];
    if (!error) {
        NSDictionary *jsonDict = [httpRequest.responseString  JSONValue];
        if([jsonDict[@"exception"] isEqualToString:@"false"]){
            settingData[@"User"][@"username"]=jsonDict[@"username"];
       //     settingData[@"User"][@"nickname"]=jsonDict[@"nickname"];
            settingData[@"SessionId"]=jsonDict[@"auth"];
            settingData[@"User"][@"userid"]=jsonDict[@"userid"];
            settingData[@"User"][@"username"]=jsonDict[@"username"];
//            settingData[@"User"][@"usergroup"]=jsonDict[@"usergroup"];
//            settingData[@"User"][@"usergrouptext"]=jsonDict[@"usergrouptext"];
         //   settingData[@"User"][@"birthday"]=jsonDict[@"birthday"];
         //   settingData[@"User"][@"intro"]=jsonDict[@"intro"];
            [self writePlistSetting:settingData];
            [self dismissModalViewControllerAnimated:true];
        }else{
          //  NSLog(@"msg %@ is %@",jsonDict[@"msg"],jsonDict[@"username"]);

        }
        
    }
    
   // [httpRequest a]
//    [httpRequest setRequestMethod:@"POST"];
//    [httpRequest setPostValue:self.userField.text forKey:@"username"];
//    [httpRequest setPostValue:self.passField.text forKey:@"password"];
//    [httpRequest startSynchronous];
//    

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
