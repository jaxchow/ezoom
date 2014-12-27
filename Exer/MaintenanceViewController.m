//
//  MaintenanceViewController.m
//  Exer
//
//  Created by jax chow on 12/24/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "MaintenanceViewController.h"
#import "ASIHTTPRequest.h"
#import "NSString+SBJSON.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "MaintenanceCell.h"
#import "MaintenanceModel.h"
#import "ProgressHUD.h"
#import "MaintenanceDetailViewController.h"

@interface MaintenanceViewController ()<ASIHTTPRequestDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_saveDataArray;
    ASIHTTPRequest *httpRequest;
}
@end

@implementation MaintenanceViewController


- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    _saveDataArray = [NSMutableArray array];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    
    _tableView.rowHeight = 120;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    //注册
    [_tableView registerNib:[UINib nibWithNibName:@"MaintenanceCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    //请求类
    httpRequest = [ASIHTTPRequest requestWithURL:DOMAIN_CONTEXT(@"/cms/mobile/maintenance/list.jspx?key=11")];
    
    //
    httpRequest.delegate = self;
    //异步发送请求
    [httpRequest startAsynchronous];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [ProgressHUD show:@"Please wait..."];
 //   [self totalDistance];
    // 2.集成刷新控件
    // Do any additional setup after loading the view.
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _saveDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MaintenanceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    if(_saveDataArray.count>0){
        MaintenanceModel *model = _saveDataArray[indexPath.row];
           cell.distance.text=@"aaa";
//        cell.userName.text = model.userName;
//        cell.userGroup.text = model.userGroup;
//        cell.weekScore.text =[NSString stringWithFormat: @"%d名", indexPath.row+1];
//        [cell.userAvatar sd_setImageWithURL:[NSURL URLWithString:model.userAvatar] placeholderImage:[UIImage imageNamed:@"photo"]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    _userLocation = newLocation;
}
-(void)totalDistance{

     CLLocation *location = [[CLLocation alloc] initWithLatitude:30.124314f longitude:120.1213f];
    
    CLLocationDistance distance = [_userLocation distanceFromLocation:location];
    NSLog(@"%@distance %@,%@",_userLocation,distance,location);
  //  return 0;

}

#pragma mark - ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSDictionary *jsonDict = [request.responseString  JSONValue];
    
    NSArray *movieArray = jsonDict[@"lists"];
    
    
    for (NSDictionary *dict  in movieArray)
    {
        MaintenanceModel *model = [[MaintenanceModel alloc] init];
        model.title = dict[@"title"];
//        model.userGroup = dict[@"year"];
//        model.userAvatar = dict[@"images"][@"large"];
        
        [_saveDataArray addObject:model];
    }
    [_tableView reloadData];
    [ProgressHUD dismiss];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [self.navigationController pushViewController:[[MaintenanceDetailViewController alloc] initWithKey:@"11"] animated:TRUE];
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"请求失败");
    [ProgressHUD dismiss];
}

-(void)openView
{
    UIViewController *targetViewController = [[MaintenanceViewController alloc] init];
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
