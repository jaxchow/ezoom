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
#import "MJRefresh.h"
#import "ProgressHUD.h"

@interface LeaderboardViewController ()<ASIHTTPRequestDelegate,UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_saveDataArray;
    ASIHTTPRequest *httpRequest;
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
   // self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] style:UIBarButtonSystemItemCompose target:self action:@selector(rules:)];
    UIButton* rightButton = (UIButton*)self.navigationItem.rightBarButtonItem;
    [rightButton addTarget:self action:@selector(boardRulesHandler:) forControlEvents:UIControlEventTouchUpInside];
    
    segmentControlTitles = [NSArray arrayWithObjects:@"积分达人榜", @"活动达人榜", nil];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:segmentControlTitles];
    [segmentControl setSelectedSegmentIndex:0];
    self.navigationItem.titleView=segmentControl;
    
    
    _saveDataArray = [NSMutableArray array];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    
    _tableView.rowHeight = 60;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    //注册
    [_tableView registerNib:[UINib nibWithNibName:@"LeaderboardCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    //请求类
    httpRequest = [ASIHTTPRequest requestWithURL:DOMAIN_URL(@"/cms/mobile/band.jspx")];
    
    //
    httpRequest.delegate = self;
    //异步发送请求
    [httpRequest startAsynchronous];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [ProgressHUD show:@"加载中..."];
    // 2.集成刷新控件
    [self setupRefresh];
    
}

- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [_tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [_tableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    //[self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    _tableView.headerPullToRefreshText = @"下拉可以刷新了";
    _tableView.headerReleaseToRefreshText = @"松开马上刷新了";
    _tableView.headerRefreshingText = @"刷新中...";
    
//    self.tableView.footerPullToRefreshText = @"上拉可以加载更多数据了";
//    self.tableView.footerReleaseToRefreshText = @"松开马上加载更多数据了";
//    self.tableView.footerRefreshingText = @"MJ哥正在帮你加载中,不客气";
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    httpRequest = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:movieURL]];
    [httpRequest startSynchronous];
    
    NSError *error = [httpRequest error];
    if (!error) {
        [_saveDataArray removeAllObjects];
        NSDictionary *jsonDict = [httpRequest.responseString  JSONValue];
        
        NSArray *movieArray = jsonDict[@"subjects"];
        
        
        for (NSDictionary *dict  in movieArray)
        {
            LeaderboardModel *model = [[LeaderboardModel alloc] init];
            model.userName = dict[@"title"];
            model.userGroup = dict[@"year"];
            model.userAvatar = dict[@"images"][@"large"];
            model.weekScore=dict[@"year"];
            [_saveDataArray addObject:model];
        }
//         [_saveDataArray insertObject:movieArray atIndex:0];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 刷新表格
            [_tableView reloadData];
            
            // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
            [_tableView headerEndRefreshing];
        });
    }
    
    // 2.2秒后刷新表格UI
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _saveDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeaderboardCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(_saveDataArray.count>0){
        LeaderboardModel *model = _saveDataArray[indexPath.row];
        
        cell.userName.text = model.userName;
        cell.userGroup.text = model.userGroup;
        cell.boardIndex.text =[NSString stringWithFormat: @"%d名", indexPath.row+1];
        cell.weekScore.text =model.weekScore;
        [cell.userAvatar sd_setImageWithURL:[NSURL URLWithString:model.userAvatar] placeholderImage:[UIImage imageNamed:@"photo"]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
   
    return cell;
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
    [_tableView reloadData];
    [ProgressHUD dismiss];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"请求失败");
    [ProgressHUD dismiss];
}

-(void)boardRulesHandler:(id *)sender{

    NSLog(@"boardRules");
   // UIAlertView alert
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
