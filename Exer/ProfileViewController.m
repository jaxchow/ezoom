//
//  ProfileViewController.m
//  Exer
//
//  Created by jax chow on 12/17/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "ProfileViewController.h"
#import "RETableViewOptionsController.h"
#import "RESegmentedItem.h"
#import "VPViewController.h"

@interface ProfileViewController ()

@property (strong, readwrite, nonatomic) RETableViewItem *avatarItem;
@property (strong, readwrite, nonatomic) RETextItem *nicknameItem;
@property (strong, readwrite, nonatomic) RETextItem *realnameItem;
@property (strong, readwrite, nonatomic) RESegmentedItem *sexItem;
@property (strong, readwrite, nonatomic) REDateTimeItem *birthdayItem;
@property (strong, readwrite, nonatomic) RELongTextItem *introItem;
@property (strong, readwrite, nonatomic) RERadioItem *hobbyItem;

@end

@implementation ProfileViewController

    NSMutableDictionary *settingData;

- (void) readPlistSettings{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"AppSettings" ofType:@"plist"];
    settingData = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
}
- (void)viewDidLoad {
    [self readPlistSettings];
    self.title=@"帐户信息";
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleBordered target:self action:@selector(rightButtonPressed:)];
    _manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    //_manager.tableView.
    [_manager addSection:self.addBaseSection];
    [_manager addSection:self.addOtherSection];
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)rightButtonPressed:(id)sender{
 
    settingData[@"User"][@"realname"]=self.realnameItem.value;
    settingData[@"User"][@"nickname"]=self.nicknameItem.value;
    settingData[@"User"][@"sexItem"]=self.sexItem.value;
    settingData[@"User"][@"birthday"]=self.birthdayItem.value;
    settingData[@"User"][@"intro"]=self.introItem.value;
    settingData[@"User"][@"hobby"]=self.hobbyItem.value;
    NSString *fileName=[[NSBundle mainBundle] pathForResource:@"AppSettings" ofType:@"plist"];
    
    //创建并写入文件
    [settingData writeToFile:fileName atomically:YES];
}

- (RETableViewSection *)addBaseSection{
     __typeof (&*self) __weak weakSelf = self;
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"个人资料"];
    self.avatarItem=[RETableViewItem itemWithTitle:@"我的头像" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        [item deselectRowAnimated:YES];
       // [weakSelf.navigationController popViewControllerAnimated:YES];
        [weakSelf.navigationController pushViewController:[[VPViewController alloc] init] animated:YES];

    }];
    //    UIImageView *avatarView=[[VPViewController alloc] init].view.subviews[0];
//    self.avatarItem.cellHeight=120;
////    NSURL *portraitUrl = [NSURL URLWithString:@"http://192.168.50.69:8090/images/logo.png"];
////    UIImage *protraitImg = [UIImage imageWithData:[NSData dataWithContentsOfURL:portraitUrl]];
//    self.avatarItem.image=avatarView.image;
    [section addItem:self.avatarItem];
    self.nicknameItem = [RETextItem itemWithTitle:@"昵称" value:settingData[@"User"][@"nickname"] placeholder:@"昵称"];
    [section addItem:self.nicknameItem];
    self.realnameItem = [RETextItem itemWithTitle:@"真实姓名" value:settingData[@"User"][@"realname"] placeholder:@"请填写真名姓名"];
    [section addItem:self.realnameItem];
    
    self.sexItem = [RESegmentedItem itemWithTitle:@"性别" value:settingData[@"User"][@"sex"] switchValueChangeHandler:^(RESegmentedItem *item) {
       // NSLog(@"Value: %@", item);
        //self.sexItem.value=item;
    }];
    [section addItem:self.sexItem];
    
    self.birthdayItem = [REDateTimeItem itemWithTitle:@"出生日期" value:settingData[@"User"][@"birthday"] placeholder:@"请选择出生日期" format:@"yyyy-MM-dd" datePickerMode:UIDatePickerModeDate];
    [section addItem:self.birthdayItem];
    
    self.introItem = [RELongTextItem itemWithTitle:@"个人描述" value:settingData[@"User"][@"intro"] placeholder:@"这家伙很牛舍也不留"];
    self.introItem.cellHeight = 88;
    [section addItem:self.introItem];
    
    return section;
}

-(RETableViewSection *)addOtherSection{
     __typeof (&*self) __weak weakSelf = self;
    RETableViewSection *section = [RETableViewSection   sectionWithHeaderTitle:@"其他"];
    
        self.hobbyItem= [RERadioItem itemWithTitle:@"兴趣爱好" value:settingData[@"User"][@"hobby"] selectionHandler:^(RERadioItem *item) {
        [item deselectRowAnimated:YES];
        
        NSMutableArray *options = [[NSMutableArray alloc] init];
        [options addObject:[NSString stringWithFormat:@"K歌"]];
        [options addObject:[NSString stringWithFormat:@"自驾"]];
        [options addObject:[NSString stringWithFormat:@"运动"]];
        [options addObject:[NSString stringWithFormat:@"游戏"]];
        [options addObject:[NSString stringWithFormat:@"旅游"]];
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
    [section addItem:self.hobbyItem];
    
    return section;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}




@end
