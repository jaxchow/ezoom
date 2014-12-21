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


-(void)openView
{
    UIViewController *targetViewController = [[AppSettingsViewController alloc] init];
    [self.navigationController pushViewController:targetViewController animated:YES];
}

- (void)viewDidLoad {
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
        username.detailLabelText=@"Jaxchow";
  
        [section addItem:username];
    // Add items to this section
    RETableViewItem *usergroup = [RETableViewItem itemWithTitle:@"会员等级" style:UITableViewCellStyleValue1 accessoryType:UITableViewCellAccessoryNone  selectionHandler:^(RETableViewItem *item) {
        [item deselectRowAnimated:YES];
    }];
    usergroup.detailLabelText=@"车逸族成员";
    [section addItem:usergroup];
   
    RETableViewItem *userpoint = [RETableViewItem itemWithTitle:@"帐户积分" style:UITableViewCellStyleValue1 accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        [item deselectRowAnimated:YES];
        [self.navigationController pushViewController:[[ScoreViewController alloc] init] animated:YES];
    }];
    userpoint.detailLabelText=@"1234";
    [section addItem:userpoint];
    
    
    RETableViewItem *userpass = [RETableViewItem itemWithTitle:@"密码修改" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
       [item deselectRowAnimated:YES];
        [self.navigationController pushViewController:[[ModifyPasswordViewController alloc] init] animated:YES];
    }];
    [section addItem:userpass];

    
//    self.textItem = [RETextItem itemWithTitle:@"Text item" value:nil placeholder:@"Text"];
//    self.numberItem = [RENumberItem itemWithTitle:@"Phone" value:@"" placeholder:@"(123) 456-7890" format:@"(XXX) XXX-XXXX"];
//    self.passwordItem = [RETextItem itemWithTitle:@"Password" value:nil placeholder:@"Password item"];
//    self.passwordItem.secureTextEntry = YES;
//    self.boolItem = [REBoolItem itemWithTitle:@"Bool item" value:YES switchValueChangeHandler:^(REBoolItem *item) {
//        NSLog(@"Value: %@", item.value ? @"YES" : @"NO");
//    }];
//    self.floatItem = [REFloatItem itemWithTitle:@"Float item" value:0.3 sliderValueChangeHandler:^(REFloatItem *item) {
//        NSLog(@"Value: %f", item.value);
//    }];
//    self.dateTimeItem = [REDateTimeItem itemWithTitle:@"Date / Time" value:[NSDate date] placeholder:nil format:@"MM/dd/yyyy hh:mm a" datePickerMode:UIDatePickerModeDateAndTime];
    /*
    self.radioItem = [RERadioItem itemWithTitle:@"Radio" value:@"Option 4" selectionHandler:^(RERadioItem *item) {
        [item deselectRowAnimated:YES]; // same as [weakSelf.tableView deselectRowAtIndexPath:item.indexPath animated:YES];
        
        // Generate sample options
        //
        NSMutableArray *options = [[NSMutableArray alloc] init];
        for (NSInteger i = 1; i < 40; i++)
            [options addObject:[NSString stringWithFormat:@"Option %i", i]];
        
        // Present options controller
        //
        RETableViewOptionsController *optionsController = [[RETableViewOptionsController alloc] initWithItem:item options:options multipleChoice:NO completionHandler:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
            
            [item reloadRowWithAnimation:UITableViewRowAnimationNone]; // same as [weakSelf.tableView reloadRowsAtIndexPaths:@[item.indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
        
        // Adjust styles
        //
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
    */
   
//    self.longTextItem = [RELongTextItem itemWithValue:nil placeholder:@"Multiline text field"];
//    self.longTextItem.cellHeight = 88;
    
//    [section addItem:self.fullLengthFieldItem];
//    [section addItem:self.textItem];
//    [section addItem:self.numberItem];
//    [section addItem:self.passwordItem];
//    [section addItem:self.boolItem];
//    [section addItem:self.floatItem];
//    [section addItem:self.dateTimeItem];
//    [section addItem:self.radioItem];
//    [section addItem:self.multipleChoiceItem];
//    [section addItem:self.longTextItem];
    

    
    return section;
}

- (RETableViewSection *)addProfileSection
{
    __typeof (&*self) __weak weakSelf = self;
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"个人信息"];
        RERadioItem *cityItem= [RERadioItem itemWithTitle:@"所在城市" value:@"杭州" selectionHandler:^(RERadioItem *item) {
        [item deselectRowAnimated:YES];
        
        NSMutableArray *options = [[NSMutableArray alloc] init];
            [options addObject:[NSString stringWithFormat:@"杭州", 1]];
            [options addObject:[NSString stringWithFormat:@"温州", 2]];
            [options addObject:[NSString stringWithFormat:@"宁波", 3]];
            [options addObject:[NSString stringWithFormat:@"嘉兴", 4]];
            [options addObject:[NSString stringWithFormat:@"绍兴", 5]];
            [options addObject:[NSString stringWithFormat:@"湖州", 6]];
            [options addObject:[NSString stringWithFormat:@"台州", 7]];
            [options addObject:[NSString stringWithFormat:@"金华", 8]];
            [options addObject:[NSString stringWithFormat:@"衢州", 9]];
            [options addObject:[NSString stringWithFormat:@"舟山", 10]];
        
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
        [options addObject:[NSString stringWithFormat:@"杭州", 1]];
        [options addObject:[NSString stringWithFormat:@"温州", 2]];
        [options addObject:[NSString stringWithFormat:@"宁波", 3]];
        [options addObject:[NSString stringWithFormat:@"嘉兴", 4]];
        [options addObject:[NSString stringWithFormat:@"绍兴", 5]];
        [options addObject:[NSString stringWithFormat:@"湖州", 6]];
        [options addObject:[NSString stringWithFormat:@"台州", 7]];
        [options addObject:[NSString stringWithFormat:@"金华", 8]];
        [options addObject:[NSString stringWithFormat:@"衢州", 9]];
        [options addObject:[NSString stringWithFormat:@"舟山", 10]];
        
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
