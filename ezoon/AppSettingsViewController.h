//
//  AppSettingsViewController.h
//  ezoon
//
//  Created by zhouhuan on 12/10/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IASKAppSettingsViewController.h"
@interface AppSettingsViewController : IASKAppSettingsViewController <IASKSettingsDelegate, UITextViewDelegate> {
    IASKAppSettingsViewController *appSettingsViewController;
}
@property (nonatomic, retain) IASKAppSettingsViewController *appSettingsViewController;
-(void) openView;
@end
