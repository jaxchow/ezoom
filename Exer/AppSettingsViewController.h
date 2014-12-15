//
//  AppSettingsViewController.h
//  Exer
//
//  Created by jax chow on 12/15/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IASKAppSettingsViewController.h"

@interface AppSettingsViewController : UIViewController<IASKSettingsDelegate,UITextViewDelegate>{
    IASKAppSettingsViewController  *appSettingsViewController;
}
@property (nonatomic, retain) IASKAppSettingsViewController *appSettingsViewController;
-(void) openView;
@end
