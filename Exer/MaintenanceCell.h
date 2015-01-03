//
//  MaintenanceCell.h
//  Exer
//
//  Created by jax chow on 12/24/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaintenanceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (strong, nonatomic) IBOutlet UIButton *detailButton;
-(IBAction)detailHandler:(id)sender;
@end
