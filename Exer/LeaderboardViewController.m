//
//  LeaderboardViewController.m
//  ezoon
//
//  Created by jax chow on 11/23/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#import "LeaderboardViewController.h"
#import "LeaderboardTableView.h"
#import "RecipeSegmentControl.h"
//#import "RecipeSegmentControl.h"

@interface LeaderboardViewController ()

@end

@implementation LeaderboardViewController

- (void)viewDidLoad {
    //self.navigationController.navigationBarHidden  =TRUE;
    self.title=@"达人排行榜";
    LeaderboardTableView *tableView= [[LeaderboardTableView alloc] init];
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_pattern_wood.png"]]];
    [self.view addSubview:[[RecipeSegmentControl alloc] init]];
   // [self.navigationController pushViewController:tableViewController animated:YES];
    [self.view addSubview:tableView];
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
