//
//  SYViewController.m
//  Exer
//
//  Created by Sauchye on 14-9-5.
//  Copyright (c) 2014年 Sauchye. All rights reserved.
//

#define movieURL  @"http://api.douban.com/v2/movie/top250"

#import "SYViewController.h"
#import "ASIHTTPRequest.h"
#import "NSString+SBJSON.h"
#import "UIImageView+WebCache.h"
#import "SYMovieModel.h"
#import "SYCell.h"

@interface SYViewController () <ASIHTTPRequestDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
    NSMutableArray *_saveDataArray;
}

@end

@implementation SYViewController

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
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    
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
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
