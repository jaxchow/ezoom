//
//  AppSettingsViewController.m
//  ezoon
//
//  Created by zhouhuan on 12/10/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#import "AppSettingsViewController.h"
#import <MessageUI/MessageUI.h>

#import "IASKSpecifier.h"
#import "IASKSettingsReader.h"

#import "CustomViewCell.h"

@interface AppSettingsViewController ()

@end

@implementation AppSettingsViewController
@synthesize appSettingsViewController;

- (IASKAppSettingsViewController*)appSettingsViewController {
	if (!appSettingsViewController) {
		appSettingsViewController = [[IASKAppSettingsViewController alloc] initWithNibName:@"IASKAppSettingsView" bundle:nil];
		appSettingsViewController.delegate = self;
	}
	return appSettingsViewController;
}

- (void)viewDidLoad
{
    //self.navigationController.navigationBarHidden  =TRUE;
    self.title=@"个人设置";
    //   [self addChildViewController:tableView];
    self.navigationController.navigationBar.translucent = NO;
//  [self.view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_pattern_wood.png"]]];
//  [self.navigationController pushViewController:tableViewController animated:YES];
    [self.navigationController pushViewController:appSettingsViewController animated:YES];
}

- (CGFloat)settingsViewController:(id<IASKViewController>)settingsViewContoller
                        tableView:(UITableView *)tableView
        heightForHeaderForSection:(NSInteger)section {
    NSString* key = [settingsViewContoller.settingsReader keyForSection:section];
	if ([key isEqualToString:@"IASKLogo"]) {
		return [UIImage imageNamed:@"Icon.png"].size.height + 25;
	} else if ([key isEqualToString:@"IASKCustomHeaderStyle"]) {
		return 55.f;
    }
	return 0;
}

- (UIView *)settingsViewController:(id<IASKViewController>)settingsViewContoller
                         tableView:(UITableView *)tableView
           viewForHeaderForSection:(NSInteger)section {
    NSString* key = [settingsViewContoller.settingsReader keyForSection:section];
	if ([key isEqualToString:@"IASKLogo"]) {
		UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon.png"]];
		imageView.contentMode = UIViewContentModeCenter;
		return imageView;
	} else if ([key isEqualToString:@"IASKCustomHeaderStyle"]) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        label.textColor = [UIColor redColor];
        label.shadowColor = [UIColor whiteColor];
        label.shadowOffset = CGSizeMake(0, 1);
        label.numberOfLines = 0;
        label.font = [UIFont boldSystemFontOfSize:16.f];
        
        //figure out the title from settingsbundle
        label.text = [settingsViewContoller.settingsReader titleForSection:section];
        
        return label;
    }
	return nil;
}

- (CGFloat)tableView:(UITableView*)tableView heightForSpecifier:(IASKSpecifier*)specifier {
	if ([specifier.key isEqualToString:@"customCell"]) {
		return 44*3;
	}
	return 0;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForSpecifier:(IASKSpecifier*)specifier {
	CustomViewCell *cell = (CustomViewCell*)[tableView dequeueReusableCellWithIdentifier:specifier.key];
	
	if (!cell) {
		cell = (CustomViewCell*)[[[NSBundle mainBundle] loadNibNamed:@"CustomViewCell"
															   owner:self
															 options:nil] objectAtIndex:0];
	}
	cell.textView.text= [[NSUserDefaults standardUserDefaults] objectForKey:specifier.key] != nil ?
    [[NSUserDefaults standardUserDefaults] objectForKey:specifier.key] : [specifier defaultStringValue];
	cell.textView.delegate = self;
	[cell setNeedsLayout];
	return cell;
}

#pragma mark UITextViewDelegate (for CustomViewCell)
- (void)textViewDidChange:(UITextView *)textView {
    [[NSUserDefaults standardUserDefaults] setObject:textView.text forKey:@"customCell"];
    [[NSNotificationCenter defaultCenter] postNotificationName:kIASKAppSettingChanged object:@"customCell"];
}

#pragma mark -
- (void)settingsViewController:(IASKAppSettingsViewController*)sender buttonTappedForKey:(NSString*)key {
	if ([key isEqualToString:@"ButtonDemoAction1"]) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo Action 1 called" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
	} else {
		NSString *newTitle = [[[NSUserDefaults standardUserDefaults] objectForKey:key] isEqualToString:@"Logout"] ? @"Login" : @"Logout";
		[[NSUserDefaults standardUserDefaults] setObject:newTitle forKey:key];
	}
}



-(void)openView
{
    UIViewController *targetViewController = [[AppSettingsViewController alloc] init];
    [self.navigationController pushViewController:targetViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
