//
//  CouponViewController.m
//  ezoon
//
//  Created by zhouhuan on 12/9/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//
#import "CouponViewController.h"
#import "ASIHTTPRequest.h"
#import "NSString+SBJSON.h"
#import "UIImageView+WebCache.h"
#import "ActivityModel.h"
#import "ActivityItemCell.h"
#import "CouponDetailViewController.h"
#import "ProgressHUD.h"


@interface CouponViewController ()<ASIHTTPRequestDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
    NSMutableArray *_saveDataArray;
}

@end

@implementation CouponViewController


-(void)openView
{
	UIViewController *targetViewController = [[ItemViewController alloc] init];
    [self.navigationController pushViewController:targetViewController animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _saveDataArray = [NSMutableArray array];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    
    _tableView.rowHeight = 120;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    //注册
    [_tableView registerNib:[UINib nibWithNibName:@"ActivityItemCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    //请求类
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:DOMAIN_CONTEXT(@"/cms/mobile/coupom/list.jspx")];
    
    //
    request.delegate = self;
    //异步发送请求
    [request startAsynchronous];
    [ProgressHUD show:@"加载中...."];
    
}

#pragma mark - ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSDictionary *jsonDict = [request.responseString  JSONValue];
    
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
        model.limitCount =[dict[@"limitCount"] integerValue];
        model.participate=[dict[@"participate"] integerValue];
        
        [_saveDataArray addObject:model];
    }
    //刷新表
    [ProgressHUD dismiss];
    [_tableView reloadData];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"请求失败");
    [ProgressHUD dismiss];
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
    cell.title.text = model.title;
    cell.payText.text = model.payText;
    cell.cost.text =[NSString stringWithFormat:@"数量:%d",model.limitCount-model.participate];
    [cell.activityImg sd_setImageWithURL:DOMAIN_URL(model.activityImg) placeholderImage:[UIImage imageNamed:@"photo"]];
    if(model.limitCount-model.participate<=0){
        cell.cost.text =[NSString stringWithFormat:@"数量:%d",0];
        [cell.joinButton setTitle:@"已发完" forState:UIControlStateDisabled];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    ActivityModel *model = _saveDataArray[indexPath.row];
    [self.navigationController pushViewController:[[CouponDetailViewController alloc] initWithModel:model] animated:TRUE];
    
}


@end
