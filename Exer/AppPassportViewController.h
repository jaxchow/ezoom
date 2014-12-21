//
//  AppPassportViewController.h
//  Exer
//
//  Created by jax chow on 12/19/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppPassportViewController : UIViewController<UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userField;
@property (strong, nonatomic) IBOutlet UITextField *passField;
@property (strong, nonatomic) IBOutlet UIButton    *submitButton;

-(IBAction)submitLogin:(id)sender;
@end
