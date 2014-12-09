//
//  ProfileViewController.m
//  SettingsExample
//
//  Created by zhouhuan on 12/8/14.
//  Copyright (c) 2014 Rubber Duck Software. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (nonatomic, retain) UISwitch *sexSwitch;
@end

@implementation ProfileViewController

- (id) init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (!self) return nil;
    
	self.title = NSLocalizedString(@"个人头像", @"Wi-Fi Networks");
	return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.headerText = @"修改个人资料";
    self.sexSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    
    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {
        section.title = @"基本资料";
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.cellStyle = UITableViewCellStyleValue1;
			staticContentCell.reuseIdentifier = @"DetailTextCell";
            cell.textLabel.text =@"真实姓名";
            cell.detailTextLabel.text=@"游世界";
            cell.accessoryType = UITableViewCellAccessoryNone;
        } whenSelected:^(NSIndexPath *indexPath) {
            
        }];
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.cellStyle = UITableViewCellStyleValue1;
			staticContentCell.reuseIdentifier = @"DetailTextCell";
            cell.textLabel.text = @"性别";
            cell.accessoryView=self.sexSwitch;
        } whenSelected:^(NSIndexPath *indexPath) {
            
        }];
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.cellStyle = UITableViewCellStyleValue1;
			staticContentCell.reuseIdentifier = @"DetailTextCell";
            cell.textLabel.text = @"手机";
            cell.detailTextLabel.text=@"13958001441";
            //cell.accessoryType = UITableViewCellAccessoryNone;
        } whenSelected:^(NSIndexPath *indexPath) {
            
        }];
    }];
    
    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {
        section.title = NSLocalizedString(@"In Notification Center", @"In Notification Center");
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            cell.textLabel.text = NSLocalizedString(@"Weather Widget", @"Weather Widget");
            
            staticContentCell.moveable = YES;
        }];
    }];
    
    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {
        section.title = NSLocalizedString(@"Not In Notification Center", @"Not In Notification Center");
    }];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
