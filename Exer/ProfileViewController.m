//
//  ProfileViewController.m
//  Exer
//
//  Created by jax chow on 12/17/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "ProfileViewController.h"
#import "RETableViewOptionsController.h"

@interface ProfileViewController ()

@property (strong, readwrite, nonatomic) RETextItem *realnameItem;
@property (strong, readwrite, nonatomic) REBoolItem *sexItem;
@property (strong, readwrite, nonatomic) REDateTimeItem *birthdayItem;
@property (strong, readwrite, nonatomic) RELongTextItem *introItem;
@property (strong, readwrite, nonatomic) RERadioItem *hobbyItem;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    self.title=@"个人信息";
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleBordered target:self action:@selector(rightButtonPressed:)];
    _manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    [_manager addSection:self.addBaseSection];
    [_manager addSection:self.addOtherSection];
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)rightButtonPressed:(id)sender{
    NSLog(@"realnameItem = %@", self.realnameItem.value);
}

- (RETableViewSection *)addBaseSection{
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"个人资料"];
    
    self.realnameItem = [RETextItem itemWithTitle:@"真实姓名" value:nil placeholder:@"请填写真名姓名"];
    [section addItem:self.realnameItem];
    
    self.sexItem = [REBoolItem itemWithTitle:@"性别"  value:YES switchValueChangeHandler:^(REBoolItem *item) {
        NSLog(@"Value: %@", item.value ? @"男" : @"女");
    }];
    [section addItem:self.sexItem];
    
    self.birthdayItem = [REDateTimeItem itemWithTitle:@"出生日期" value:nil placeholder:@"请选择出生日期" format:@"yyyy-MM-dd" datePickerMode:UIDatePickerModeDate];
    [section addItem:self.birthdayItem];
    
    self.introItem = [RELongTextItem itemWithTitle:@"个人描述" value:nil placeholder:@"这家伙很牛舍也不留"];
    self.introItem.cellHeight = 88;
    [section addItem:self.introItem];
    
    return section;
}

-(RETableViewSection *)addOtherSection{
     __typeof (&*self) __weak weakSelf = self;
    RETableViewSection *section = [RETableViewSection   sectionWithHeaderTitle:@"其他"];
    
        self.hobbyItem= [RERadioItem itemWithTitle:@"兴趣爱好" value:@"无" selectionHandler:^(RERadioItem *item) {
        [item deselectRowAnimated:YES];
        
        NSMutableArray *options = [[NSMutableArray alloc] init];
        [options addObject:[NSString stringWithFormat:@"K歌", 1]];
        [options addObject:[NSString stringWithFormat:@"自驾", 2]];
        [options addObject:[NSString stringWithFormat:@"运动", 3]];
        [options addObject:[NSString stringWithFormat:@"游戏", 4]];
        [options addObject:[NSString stringWithFormat:@"旅游", 5]];
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
