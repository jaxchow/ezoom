//
//  ActivityViewController.m
//  Exer
//
//  Created by jax chow on 12/24/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "ActivityViewController.h"
#import "ASIHTTPRequest.h"
#import "NSString+SBJSON.h"
#import "UIImageView+WebCache.h"
#import "LeaderboardModel.h"
#import "ActivityItemCell.h"
#import "MJRefresh.h"
#import "ProgressHUD.h"
#import "ActivityModel.h"
#import "ActivityItemCell.h"
#import "CreateActivityViewController.h"

@interface ActivityViewController ()<ASIHTTPRequestDelegate,UITableViewDataSource,UITableViewDelegate>{

    UITableView *_tableView;
    NSMutableArray *_saveDataArray;
    ASIHTTPRequest *httpRequest;

}
@end

@implementation ActivityViewController

- (void)viewDidLoad {
    
    _saveDataArray = [NSMutableArray array];
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"创建活动" style:UIBarButtonItemStyleBordered target:self action:@selector(showCreateView:)];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    
    _tableView.rowHeight = 240;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    //注册
    [_tableView registerNib:[UINib nibWithNibName:@"ActivityItemCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    //请求类
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
  
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
    httpRequest = [ASIHTTPRequest requestWithURL:DOMAIN_URL(@"/mobile/coupom/list.jspx")];
    [httpRequest startSynchronous];
    
    NSError *error = [httpRequest error];
    if (!error) {
     //   [_saveDataArray removeAllObjects];
        NSDictionary *jsonDict = [httpRequest.responseString  JSONValue];
        
        NSArray *movieArray = jsonDict[@"coupoms"];
        
        
        for (NSDictionary *dict  in movieArray)
        {
            
            ActivityModel *model = [[ActivityModel alloc] init];
            model.key=dict[@"id"];
            model.title= dict[@"title"];
            model.activityImg = dict[@"activityImg"];
            model.payType = dict[@"payType"];
            model.payText = dict[@"payText"];
            model.address = dict[@"address"];
            model.content = dict[@"content"];
            model.activityType = dict[@"activityType"];
            model.typeText= dict[@"typeText"];
            model.sourceType = dict[@"sourceType"];
            model.contentType = dict[@"contentType"];
            model.cost = dict[@"cost"];
            model.limitCount = dict[@"limitCount"] ;
            model.participate = dict[@"participate"];
            
            [_saveDataArray addObject:model];
        }
        [_tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [_tableView headerEndRefreshing];
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 刷新表格
//            [_tableView reloadData];
//            
//            // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
//            [_tableView headerEndRefreshing];
//        });
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
    
    ActivityItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    ActivityModel *model = _saveDataArray[indexPath.row];
    cell.accessibilityIdentifier=model.key;
    cell.title.text = model.title;
    cell.payText.text = model.payText;
    //  cell.cost.text = model.cost;
    [cell.activityImg sd_setImageWithURL:DOMAIN_URL(model.activityImg) placeholderImage:[UIImage imageNamed:@"photo"]];
 //   cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
  //  [self.navigationController pushViewController:[[CouponDetailViewController alloc] initWithKey:@"11"] animated:TRUE];
    
}
- (void)showCreateView:(id *)sender
{
    UIViewController *createViewController=[[CreateActivityViewController alloc] init];
    [self.navigationController pushViewController:createViewController animated:true];
}

-(void)openView
{
    UIViewController *targetViewController = [[ActivityViewController alloc] init];
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
