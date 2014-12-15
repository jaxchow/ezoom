//
//  LeaderboardTableViewController.m
//  ezoon
//
//  Created by zhouhuan on 12/9/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#define boardURL @"http://api.douban.com/v2/movie/top250"
#import "LeaderboardTableView.h"
#import "RecipeSegmentControl.h"
#import "ASIHTTPRequest.h"
#import "NSString+SBJSON.h"
#import "UIImageView+WebCache.h"
#import "LeaderboardModel.h"
#import "LeaderboardCellTableViewCell.h"

@interface LeaderboardTableView ()<ASIHTTPRequestDelegate>{

    NSMutableArray *_saveDataArray;
}

@end

@implementation LeaderboardTableView

- (id)init
{
    
  
    return self;
}

- (void)viewDidLoad
{
    _saveDataArray = [[NSMutableArray alloc] initWithCapacity:16];
    
    _saveDataArray = [NSMutableArray array];
    
    self.rowHeight = 60;
    
    //注册
    [self registerNib:[UINib nibWithNibName:@"LeaderboardCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    //请求类
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:boardURL]];
    
    //
    request.delegate = self;
    //异步发送请求
    [request startAsynchronous];
   // NSLog(@"viewDidLoad");
    
//    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
//    refresh.tintColor = [UIColor lightGrayColor];
//    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
  //  [refresh addTarget:self action:@selector(refreshView:) forControlEvents:UIControlEventValueChanged];
  //  self.refreshControl = refresh;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSDictionary *jsonDict = [request.responseString  JSONValue];
    
    NSArray *movieArray = jsonDict[@"subjects"];
    
    for (NSDictionary *dict  in movieArray)
    {
        LeaderboardModel *model = [[LeaderboardModel alloc] init];
        model.userName =dict[@"title"];
        model.userGroup = dict[@"year"];
        model.userAvatar = dict[@"images"][@"medium"];
        model.weekScore = dict[@"collect_count"];
        
        [_saveDataArray addObject:model];
    }
    //刷新表
    [self reloadData];
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
    LeaderboardCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    LeaderboardModel *model = _saveDataArray[indexPath.row];
    
    cell.userName.text = model.userName;
    cell.userGroup.text = model.userGroup;
    cell.weekScore.text = model.weekScore;
    [cell.userAvatar sd_setImageWithURL:[NSURL URLWithString:model.userAvatar] placeholderImage:[UIImage imageNamed:@"photo"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}



@end
