//
//  ModifyPasswordViewController.m
//  SettingsExample
//
//  Created by zhouhuan on 12/8/14.
//  Copyright (c) 2014 Rubber Duck Software. All rights reserved.
//

#import "ModifyPasswordViewController.h"

@interface ModifyPasswordViewController ()

@end

@implementation ModifyPasswordViewController

- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (!self) return nil;
    
    self.title=@"修改密码";
    return self;
}

- (void)viewDidLoad
{
    self.headerText = @"修改密码";
    
    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.cellStyle = UITableViewCellStyleValue1;
			staticContentCell.reuseIdentifier = @"DetailTextCell";
            cell.textLabel.text =@"旧密码";
            cell.accessoryType=UITableViewCellAccessoryNone;
            cell.accessoryView=[[UITextField alloc] initWithFrame:CGRectZero];
        } whenSelected:^(NSIndexPath *indexPath) {
            
        }];
        
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.cellStyle = UITableViewCellStyleValue1;
			staticContentCell.reuseIdentifier = @"DetailTextCell";
            cell.textLabel.text = @"新密码";
            cell.accessoryView= [[UITextField alloc] initWithFrame:CGRectZero];
            cell.accessoryType=UITableViewCellAccessoryNone;
            //cell.accessoryType = UITableViewCellAccessoryNone;
        } whenSelected:^(NSIndexPath *indexPath) {
            
        }];
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.cellStyle = UITableViewCellStyleValue1;
			staticContentCell.reuseIdentifier = @"DetailTextCell";
            cell.textLabel.text = @"再次密码";
            cell.accessoryView=[[UITextField alloc] initWithFrame:CGRectZero];
            cell.accessoryType=UITableViewCellAccessoryNone;
            //cell.accessoryType = UITableViewCellAccessoryNone;
        } whenSelected:^(NSIndexPath *indexPath) {
            
        }];
    }];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
