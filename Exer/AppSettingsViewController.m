//
//  AppSettingsViewController.m
//  Exer
//
//  Created by jax chow on 12/15/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "AppSettingsViewController.h"

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

-(void)openView
{
    UIViewController *targetViewController = [[AppSettingsViewController alloc] init];
    [self.navigationController pushViewController:targetViewController animated:YES];
}

- (void)viewDidLoad {
 //   self.navigationController.navigationBarHidden=TRUE;
    self.navigationController.navigationBar.tintColor = COLOR(2, 100, 162);
    [self.view setBackgroundColor:COLOR(234,237,250)];
    [self.view addSubview:self.appSettingsViewController.view];
    // Do any additional setup after loading the view.
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
