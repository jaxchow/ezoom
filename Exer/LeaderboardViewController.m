//
//  LeaderboardViewController.m
//  ezoon
//
//  Created by jax chow on 11/23/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#define movieURL  @"http://api.douban.com/v2/movie/top250"

#import "LeaderboardViewController.h"
#import "ASIHTTPRequest.h"
#import "NSString+SBJSON.h"
#import "UIImageView+WebCache.h"
#import "LeaderboardModel.h"
#import "LeaderboardCellTableViewCell.h"

@interface LeaderboardViewController ()<ASIHTTPRequestDelegate,UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_saveDataArray;
}

@end

@implementation LeaderboardViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    _saveDataArray = [NSMutableArray array];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    
    _tableView.rowHeight = 60;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    //注册
    [_tableView registerNib:[UINib nibWithNibName:@"LeaderboardCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    //请求类
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:movieURL]];
    
    //
    request.delegate = self;
    //异步发送请求
    [request startAsynchronous];
    
}

#pragma mark - ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSDictionary *jsonDict = [request.responseString  JSONValue];
    
    NSArray *movieArray = jsonDict[@"subjects"];
    
    for (NSDictionary *dict  in movieArray)
    {
        LeaderboardModel *model = [[LeaderboardModel alloc] init];
        model.userName = dict[@"title"];
        model.userGroup = dict[@"year"];
        model.userAvatar = dict[@"images"][@"large"];
        
        [_saveDataArray addObject:model];
    }
    //刷新表
    [_tableView reloadData];
}
-(void)handleData
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm:ss a"];
    NSString *lastUpdated = [NSString stringWithFormat:@"Last updated on %@", [formatter stringFromDate:[NSDate date]]];

    [_tableView reloadData];
}



- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"请求失败");
}

-(void)refreshView:(UIRefreshControl *)refresh
{
    if (refresh.refreshing) {
        refresh.attributedTitle = [[NSAttributedString alloc]initWithString:@"Refreshing data..."];
        [self performSelector:@selector(handleData) withObject:nil afterDelay:2];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _saveDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeaderboardCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    LeaderboardModel *model = _saveDataArray[indexPath.row];
    
    cell.userName.text = model.userName;
    cell.userGroup.text = model.userGroup;
    cell.weekScore.text =[NSString stringWithFormat: @"%d名", indexPath.row+1];
    [cell.userAvatar sd_setImageWithURL:[NSURL URLWithString:model.userAvatar] placeholderImage:[UIImage imageNamed:@"photo"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   // cell.accessoryView=
    return cell;
}

-(void)openView
{
    UIViewController *targetViewController = [[ItemViewController alloc] init];
    [self.navigationController pushViewController:targetViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
