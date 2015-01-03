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
#import "NSString+SBJSON.h"
#import "ASIFormDataRequest.h"

@interface CouponDetailViewController ()
{
     ActivityModel  *_model;
}
@end


@implementation CouponDetailViewController


- (id)initWithModel:(ActivityModel*)model{
    self.title=model.title;
    _model=model;
 //   self=[self  initWithNibName:@"CouponDetailViewController.xib" bundle:nil];
    return self;
}


- (void)viewDidLoad {
    //_model.title

    [super viewDidLoad];
    //   self.title.text=_model.title;
    self.payText.text=_model.payText;

    [self.activityImg sd_setImageWithURL:DOMAIN_URL(_model.activityImg) placeholderImage:[UIImage imageNamed:@"photo"]];
    self.cost.text=[NSString stringWithFormat:@"数量:%ld",_model.limitCount-_model.participate];
    self.endDate.text=[NSString stringWithFormat:self.endDate.text,_model.endDate];
    self.address.text=_model.address;
    self.desc.text=_model.content;
    // Do any additional setup after loading the view from its nib.
}

-(void)join:(id)sender{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                 initWithTitle:@" UIActionSheet<title>"
                                 delegate:self
                                 cancelButtonTitle:nil
                                 destructiveButtonTitle:nil
                                 otherButtonTitles:@"确认支付", @"取消支付", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    actionSheet.destructiveButtonIndex = 1; // make the second button red(destructive)
    [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        [self payAction:_model];
    } else {
    }
    
}
    
-(void)payAction:(ActivityModel *)model
    {
    ASIFormDataRequest *httpRequest=[ASIFormDataRequest requestWithURL:DOMAIN_CONTEXT(@"/cms/mobile/coupom/signup.jspx")];

    [httpRequest addPostValue:@"13" forKey:@"userid"];
    [httpRequest addPostValue:_model.key forKey:@"key"];
    [httpRequest startSynchronous];
    NSError *error = [httpRequest error];
    if (!error) {
        NSDictionary *jsonDict = [httpRequest.responseString  JSONValue];
        if([jsonDict[@"exception"] isEqualToString:@"false"]){
            [self.joinButton setTitle:@"已获取" forState:UIControlStateDisabled];
        }
        
    }
}
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if(buttonIndex==1){
//        ASIFormDataRequest *httpRequest=[ASIFormDataRequest requestWithURL:DOMAIN_CONTEXT(@"/cms/mobile/coupom/signup.jspx")];
//        
//        [httpRequest addPostValue:@"13" forKey:@"userid"];
//        [httpRequest addPostValue:_model.key forKey:@"key"];
//        [httpRequest startSynchronous];
//        NSError *error = [httpRequest error];
//        if (!error) {
//            NSDictionary *jsonDict = [httpRequest.responseString  JSONValue];
//            if([jsonDict[@"exception"] isEqualToString:@"false"]){
//                [self.joinButton setTitle:@"已获取" forState:UIControlStateDisabled];
//            }
//
//        }
//    }
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
