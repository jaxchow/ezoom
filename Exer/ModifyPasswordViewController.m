//
//  ModifyPasswordViewControllerTableViewController.m
//  Exer
//
//  Created by jax chow on 12/17/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "ModifyPasswordViewController.h"
#import "RETextItem.h"

@interface ModifyPasswordViewController ()

@property (strong, readwrite, nonatomic) RETextItem *oldPasswordItem;
@property (strong, readwrite, nonatomic) RETextItem *passwordItem;
@property (strong, readwrite, nonatomic) RETextItem *againPasswordItem;

@end

@implementation ModifyPasswordViewController

- (void)viewDidLoad {
    _manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    [self addPasswordSection];
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (RETableViewSection *)addPasswordSection{
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@""];
    
    self.oldPasswordItem = [RETextItem itemWithTitle:@"旧密码" value:nil placeholder:@"旧密码"];
    self.oldPasswordItem.secureTextEntry = YES;
    [section addItem:self.oldPasswordItem];
    
    
    self.passwordItem = [RETextItem itemWithTitle:@"新密码" value:nil placeholder:@"新密码"];
    self.passwordItem.secureTextEntry = YES;
    [section addItem:self.passwordItem];
    
    
    self.againPasswordItem = [RETextItem itemWithTitle:@"再次密码" value:nil placeholder:@"再次密码"];
    self.againPasswordItem.secureTextEntry = YES;
    [section addItem:self.againPasswordItem];
    
    __typeof (&*self) __weak weakSelf = self;
    
    [_manager addSection:section];
    
    RETableViewItem *buttonItem = [RETableViewItem itemWithTitle:@"确定" accessoryType:UITableViewCellAccessoryNone selectionHandler:^(RETableViewItem *item) {
        [weakSelf.tableView deselectRowAtIndexPath:item.indexPath animated:YES];
        NSLog(@"Button pressed");
    }];
    buttonItem.textAlignment = NSTextAlignmentCenter;
    [section addItem:buttonItem];
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
