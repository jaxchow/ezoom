//
//  ScoreViewController.m
//  Exer
//
//  Created by jax chow on 12/17/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "ScoreViewController.h"
#import "CouponViewController.h"
#import "ScoreRulesViewController.h"
#import "ASIHTTPRequest.h"

@interface ScoreViewController ()<ASIHTTPRequestDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    UITableView *_tableView;
    UIView *_scoreView;
    NSMutableArray *_saveDataArray;

}

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    self.title =@"我的积分";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"积分规则" style:UIBarButtonItemStyleBordered target:self action:@selector(showScoreRules:)];
    self._scoreView=[[UIView alloc] initWithFrame:CGRectMake(0,30,self.view.frame.size.width,180)];
    [self._scoreView setBackgroundColor:COLOR(255, 255, 255)];
    [self.view addSubview:self._scoreView];
    self._tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 180, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    [self.view addSubview:self._tableView];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)showScoreRules:(id *)sender{
    [self.navigationController pushViewController:[[ScoreRulesViewController alloc] init] animated:YES];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _saveDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //[self.navigationController pushViewController:[[CouponDetailViewController alloc] initWithKey:@"11"] animated:TRUE];
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
