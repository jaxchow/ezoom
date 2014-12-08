//
//  SettingsViewController.m
//  ezoon
//
//  Created by jax chow on 11/23/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#import "SettingsViewController.h"
#import "ModifyPasswordViewController.h"

@interface SettingsViewController ()
    @property (nonatomic, retain) UISwitch *airplaneModeSwitch;
@end

@implementation SettingsViewController

-(id) init{

    self = [super initWithStyle:UITableViewStyleGrouped];
    if (!self) return nil;
    
    self.title = NSLocalizedString(@"个人资料", @"Settings");

    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.airplaneModeSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    
    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {
        section.title=@"帐户资料";
      
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.cellStyle = UITableViewCellStyleValue1;
            staticContentCell.reuseIdentifier = @"DetailTextCell";
            cell.textLabel.text = NSLocalizedString(@"会员名称", @"Account");
            cell.detailTextLabel.text = NSLocalizedString(@"Jaxchow", @"Jaxchow");
        } whenSelected:^(NSIndexPath *indexPath) {
      //      [self.navigationController pushViewController:[[ProfileViewController alloc] init] animated:YES];
        }];
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.cellStyle = UITableViewCellStyleValue1;
            staticContentCell.reuseIdentifier = @"DetailTextCell";
            cell.textLabel.text = NSLocalizedString(@"会员等级", @"Account");
            cell.detailTextLabel.text = NSLocalizedString(@"车逸族成员", @"Jaxchow");
        }];
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.cellStyle = UITableViewCellStyleValue1;
            staticContentCell.reuseIdentifier = @"DetailTextCell";
            
            cell.textLabel.text = NSLocalizedString(@"密码", @"password");
            cell.detailTextLabel.text = NSLocalizedString(@"修改密码", @"Jaxchow");
        } whenSelected:^(NSIndexPath *indexPath) {
            [self.navigationController pushViewController:[[ModifyPasswordViewController alloc] init] animated:YES];
        }];
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.cellStyle = UITableViewCellStyleValue1;
            staticContentCell.reuseIdentifier = @"DetailTextCell";
            
            cell.textLabel.text = NSLocalizedString(@"手机", @"password");
            cell.detailTextLabel.text = NSLocalizedString(@"13958001441", @"Jaxchow");
        } whenSelected:^(NSIndexPath *indexPath) {
       //     [self.navigationController pushViewController:[[NotificationsViewController alloc] init] animated:YES];
        }];
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.cellStyle = UITableViewCellStyleValue1;
            staticContentCell.reuseIdentifier = @"DetailTextCell";
            
            cell.textLabel.text = NSLocalizedString(@"邮箱", @"password");
            cell.detailTextLabel.text = NSLocalizedString(@"Jaxchow@gmail.com", @"Jaxchow");
        } whenSelected:^(NSIndexPath *indexPath) {
            //[self.navigationController pushViewController:[[WifiViewController alloc] init] animated:YES];
        }];
    }];
    
    
    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {
        section.title=@"我的背包";
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            cell.textLabel.text = NSLocalizedString(@"我的积分", @"Sounds");
            cell.detailTextLabel.text = NSLocalizedString(@"1234", @"Jaxchow");
            //	cell.imageView.image = [UIImage imageNamed:@"Sounds"];
        } whenSelected:^(NSIndexPath *indexPath) {
            //TODO
        }];
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            cell.textLabel.text = NSLocalizedString(@"我的车型", @"Brightness");
            //	cell.imageView.image = [UIImage imageNamed:@"Brightness"];
        } whenSelected:^(NSIndexPath *indexPath) {
            //TODO
        }];
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            cell.textLabel.text = NSLocalizedString(@"我的优惠券", @"Wallpaper");
        } whenSelected:^(NSIndexPath *indexPath) {
            //TODO
        }];
    }];
    // Do any additional setup after loading the view from its nib.
}

-(void)openView
{
    UIViewController *targetViewController = [[SettingsViewController alloc] init];
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
