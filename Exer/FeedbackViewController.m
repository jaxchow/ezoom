//
//  FeedbackViewController.m
//  ezoom
//
//  Created by jax chow on 12/27/14.
//  Copyright (c) 2014 JaxTeam. All rights reserved.
//

#import "FeedbackViewController.h"
#import "AAMFeedbackViewController.h"
#import "ItemViewController.h"

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AAMFeedbackViewController *feedbackController = [[AAMFeedbackViewController alloc]init];
    feedbackController.toRecipients = [NSArray arrayWithObject:@"jaxchow@email.com"];
    feedbackController.ccRecipients = nil;
    feedbackController.bccRecipients = nil;
    //[self.view addSubview:targetViewController.view];
    [self.navigationController pushViewController:feedbackController animated:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)openView
{
    UIViewController *targetViewController=[[FeedbackViewController alloc] init];
    [self.navigationController pushViewController:targetViewController animated:true];
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
