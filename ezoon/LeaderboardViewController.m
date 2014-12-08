//
//  LeaderboardViewController.m
//  ezoon
//
//  Created by jax chow on 11/23/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#import "LeaderboardViewController.h"

@interface LeaderboardViewController ()

@end

@implementation LeaderboardViewController

- (void)viewDidLoad {
    self.navigationController.navigationBarHidden  =TRUE;

   	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:2/255.0 green:100/255.0 blue:162/255.0 alpha:1];
    [self.view setBackgroundColor:[UIColor colorWithRed:243/255.0 green:237/255.0 blue:250/255.0 alpha:1]];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(20, 20, 100, 40);
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitle:@"Item" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(openView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view from its nib.
}

-(void)openView
{
    UIViewController *targetViewController = [[LeaderboardViewController alloc] init];
    
    [self.navigationController pushViewController:targetViewController animated:YES];
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
