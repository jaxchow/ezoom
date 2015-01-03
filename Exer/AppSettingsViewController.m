//
//  AppSettingsViewController.m
//  Exer
//
//  Created by jax chow on 12/15/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "AppSettingsViewController.h"
#import "RETableViewOptionsController.h"
#import "ModifyPasswordViewController.h"
#import "ProfileViewController.h"
#import "ScoreViewController.h"
#import "AppPassportViewController.h"

@interface AppSettingsViewController ()

@property (strong, readwrite, nonatomic) RETextItem *fullLengthFieldItem;
@property (strong, readwrite, nonatomic) RETextItem *textItem;
@property (strong, readwrite, nonatomic) RENumberItem *numberItem;
@property (strong, readwrite, nonatomic) RETextItem *passwordItem;
@property (strong, readwrite, nonatomic) REBoolItem *boolItem;
@property (strong, readwrite, nonatomic) REFloatItem *floatItem;
@property (strong, readwrite, nonatomic) REDateTimeItem *dateTimeItem;
@property (strong, readwrite, nonatomic) RERadioItem *radioItem;
@property (strong, readwrite, nonatomic) REMultipleChoiceItem *multipleChoiceItem;
@property (strong, readwrite, nonatomic) RELongTextItem *longTextItem;
@property (strong, readwrite, nonatomic) RECreditCardItem *creditCardItem;
@end

@implementation AppSettingsViewController

    NSMutableDictionary *settingData;

-(void)openView
{
    UIViewController *targetViewController = [[AppSettingsViewController alloc] init];
    [self.navigationController pushViewController:targetViewController animated:YES];
}
- (void) readPlistSettings{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"AppSettings" ofType:@"plist"];
    settingData = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
   // NSLog(@"%@", settingData);

}
- (void)viewDidLoad {
    [self readPlistSettings];
 //   self.navigationController.navigationBarHidden=TRUE;
    self.navigationController.navigationBar.tintColor = COLOR(2, 100, 162);
    _manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    
    self.accountSection = [self addAccountSection];
    [_manager addSection:self.accountSection];
    self.profileSection = [self addProfileSection];
    [_manager addSection:self.profileSection];

    self.serviceSection = [self addServiceSection];
    [_manager addSection:self.serviceSection];
    
    self.buttomSection = [self addButtonSection];
    [_manager addSection:self.buttomSection];
}

- (RETableViewSection *)addAccountSection
{
    __typeof (&*self) __weak weakSelf = self;
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"帐户信息"];
    
        RETableViewItem *username = [RETableViewItem itemWithTitle:@"帐户名称" style:UITableViewCellStyleValue1 accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
            [item deselectRowAnimated:YES];
            [self.navigationController pushViewController:[[ProfileViewController alloc] init] animated:YES];
        }];
    
        username.detailLabelText=settingData[@"User"][@"username"];
  
        [section addItem:username];
    // Add items to this section
    RETableViewItem *usergroup = [RETableViewItem itemWithTitle:@"会员等级" style:UITableViewCellStyleValue1 accessoryType:UITableViewCellAccessoryNone  selectionHandler:^(RETableViewItem *item) {
        [item deselectRowAnimated:YES];
    }];
    usergroup.detailLabelText=settingData[@"User"][@"usergrouptext"];
    [section addItem:usergroup];
   
    RETableViewItem *userpoint = [RETableViewItem itemWithTitle:@"帐户积分" style:UITableViewCellStyleValue1 accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        [item deselectRowAnimated:YES];
        [self.navigationController pushViewController:[[ScoreViewController alloc] init] animated:YES];
    }];
    userpoint.detailLabelText=[NSString stringWithFormat: @"%@", settingData[@"User"][@"userscore"]];
    [section addItem:userpoint];
    
    
    RETableViewItem *userpass = [RETableViewItem itemWithTitle:@"密码修改" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
       [item deselectRowAnimated:YES];
        [self.navigationController pushViewController:[[ModifyPasswordViewController alloc] init] animated:YES];
    }];
    [section addItem:userpass];
    
    return section;
}

- (RETableViewSection *)addProfileSection
{
    __typeof (&*self) __weak weakSelf = self;
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"个人信息"];
        RERadioItem *cityItem= [RERadioItem itemWithTitle:@"所在城市" value:settingData[@"User"][@"city"] selectionHandler:^(RERadioItem *item) {
        [item deselectRowAnimated:YES];
        
        NSMutableArray *options = [[NSMutableArray alloc] init];
            [options addObject:[NSString stringWithFormat:@"杭州"]];
            [options addObject:[NSString stringWithFormat:@"温州"]];
            [options addObject:[NSString stringWithFormat:@"宁波"]];
            [options addObject:[NSString stringWithFormat:@"嘉兴"]];
            [options addObject:[NSString stringWithFormat:@"绍兴"]];
            [options addObject:[NSString stringWithFormat:@"湖州"]];
            [options addObject:[NSString stringWithFormat:@"台州"]];
            [options addObject:[NSString stringWithFormat:@"金华"]];
            [options addObject:[NSString stringWithFormat:@"衢州"]];
            [options addObject:[NSString stringWithFormat:@"舟山"]];
        
        RETableViewOptionsController *optionsController = [[RETableViewOptionsController alloc] initWithItem:item options:options multipleChoice:NO completionHandler:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
            
            [item reloadRowWithAnimation:UITableViewRowAnimationNone]; // same as [weakSelf.tableView reloadRowsAtIndexPaths:@[item.indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
        
        optionsController.delegate = weakSelf;
        optionsController.style = section.style;
        if (weakSelf.tableView.backgroundView == nil) {
            optionsController.tableView.backgroundColor = weakSelf.tableView.backgroundColor;
            optionsController.tableView.backgroundView = nil;
        }
        
        // Push the options controller
        //
        [weakSelf.navigationController pushViewController:optionsController animated:YES];
    }];
    [section addItem:cityItem];
    
    
    RERadioItem *carItem= [RERadioItem itemWithTitle:@"车辆车型" value:@"大众" selectionHandler:^(RERadioItem *item) {
        [item deselectRowAnimated:YES];
        
        NSMutableArray *options = [[NSMutableArray alloc] init];
        [options addObject:[NSString stringWithFormat:@"宝马"]];
        [options addObject:[NSString stringWithFormat:@"奥迪"]];
        [options addObject:[NSString stringWithFormat:@"奔驰"]];
        [options addObject:[NSString stringWithFormat:@"大众"]];
        [options addObject:[NSString stringWithFormat:@"丰田"]];
        [options addObject:[NSString stringWithFormat:@"现代"]];
        
        RETableViewOptionsController *optionsController = [[RETableViewOptionsController alloc] initWithItem:item options:options multipleChoice:NO completionHandler:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
            
            [item reloadRowWithAnimation:UITableViewRowAnimationNone]; // same as [weakSelf.tableView reloadRowsAtIndexPaths:@[item.indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
        
        optionsController.delegate = weakSelf;
        optionsController.style = section.style;
        if (weakSelf.tableView.backgroundView == nil) {
            optionsController.tableView.backgroundColor = weakSelf.tableView.backgroundColor;
            optionsController.tableView.backgroundView = nil;
        }
        
        // Push the options controller
        //
        [weakSelf.navigationController pushViewController:optionsController animated:YES];
    }];
    [section addItem:carItem];
    
    return section;
}
-(RETableViewSection *) addServiceSection{

    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"我的服务"];
    
    RETableViewItem *coupomItem = [RETableViewItem itemWithTitle:@"我的优惠券" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        [item deselectRowAnimated:YES];
    }];
    [section addItem:coupomItem];
    
    
    RETableViewItem *activityItem = [RETableViewItem itemWithTitle:@"我的活动" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        [item deselectRowAnimated:YES];
    }];
    [section addItem:activityItem];
    
    return section;

}
-(RETableViewSection *) addButtonSection{
    
       __typeof (&*self) __weak weakSelf = self;
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@" "];
   
    RETableViewItem *buttonItem = [RETableViewItem itemWithTitle:@"退出" accessoryType:UITableViewCellAccessoryNone selectionHandler:^(RETableViewItem *item) {
        [weakSelf.tableView deselectRowAtIndexPath:item.indexPath animated:YES];
        NSLog(@"已退出，请重新登录！");
        
        [weakSelf.navigationController presentModalViewController:[[AppPassportViewController alloc] init] animated:TRUE];
    }];
    buttonItem.textAlignment = NSTextAlignmentCenter;
    [section addItem:buttonItem];
    
    return section;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
