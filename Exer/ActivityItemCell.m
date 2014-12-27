//
//  SYCell.m
//  Exer
//
//  Created by Sauchye on 14-9-5.
//  Copyright (c) 2014年 Sauchye. All rights reserved.
//

#import "ActivityItemCell.h"

@interface ActivityItemCell ()

@end

@implementation ActivityItemCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)join:(id)sender{
    NSLog(@"@show pay view");
}

@end
