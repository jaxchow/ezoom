//
//  MainProfileView.m
//  ezoon
//
//  Created by zhouhuan on 12/9/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#import "MainProfileView.h"
#import "PAImageView.h"
#import "AFNetworking.h"

@implementation MainProfileView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    self.backgroundColor=[UIColor colorWithRed:182/255.0f green:182/255.0f blue:187/255.0f alpha:1.0f];
    PAImageView *avaterImageView=[[PAImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [avaterImageView.layer setPosition:CGPointMake(160, 80)];
    UILabel *userName=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    userName.text=@"Jaxchow";
    userName.textAlignment=NSTextAlignmentCenter;
    [userName.layer setPosition:CGPointMake(160, 160)];
    
    UILabel *userGroupName=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    userName.text=@"车逸族成员";
    userName.textAlignment=NSTextAlignmentCenter;
    userName.textColor=[UIColor colorWithRed:1.0f green:0.5f blue:0 alpha:1.0f];
    [userName.layer setPosition:CGPointMake(160, 190)];
    [self addSubview:userName];
    [self addSubview:userGroupName];
    [self addSubview:avaterImageView];
    [avaterImageView setImageURL:@"http://192.168.50.69:8090/images/logo.png"];
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
