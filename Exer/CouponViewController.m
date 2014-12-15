//
//  CouponViewController.m
//  ezoon
//
//  Created by zhouhuan on 12/9/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//
#define movieURL  @"http://api.douban.com/v2/movie/top250"
#import "CouponViewController.h"
#import "ASIHTTPRequest.h"
#import "NSString+SBJSON.h"
#import "UIImageView+WebCache.h"
#import "SYMovieModel.h"
#import "SYCell.h"
#import "CouponDetailViewController.h"


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
    [_tableView registerNib:[UINib nibWithNibName:@"SYCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
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
        SYMovieModel *model = [[SYMovieModel alloc] init];
        model.movieName = dict[@"title"];
        model.movieYear = dict[@"year"];
        model.movieImage = dict[@"images"][@"large"];
        
        [_saveDataArray addObject:model];
    }
    //刷新表
    [_tableView reloadData];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"请求失败");
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _saveDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SYCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    SYMovieModel *model = _saveDataArray[indexPath.row];
    
    cell.name.text = model.movieName;
    cell.year.text = model.movieYear;
    [cell.movieImageView sd_setImageWithURL:[NSURL URLWithString:model.movieImage] placeholderImage:[UIImage imageNamed:@"photo"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:[[CouponDetailViewController alloc] initWithKey:@"11"] animated:TRUE];
}


@end
