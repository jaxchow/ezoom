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
#import "RKTabView.h"
#import "RKTabItem.h"

@implementation MainProfileView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    RKTabView *titledTabsView = [[RKTabView alloc] initWithFrame:CGRectMake(0, 150, 320, 60)];
    
    [self addSubview:titledTabsView];
    self.backgroundColor=[UIColor colorWithRed:182/255.0f green:182/255.0f blue:187/255.0f alpha:1.0f];
    PAImageView *avaterImageView=[[PAImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [avaterImageView.layer setPosition:CGPointMake(CGRectGetMidX(self.bounds), 80)];
    UILabel *userName=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    userName.text=@"Jaxchow";
    userName.textAlignment=NSTextAlignmentCenter;
    [userName.layer setPosition:CGPointMake(CGRectGetMidX(self.bounds),150)];
    
    UILabel *userGroupName=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    userName.text=@"车逸族成员";
    userName.textAlignment=NSTextAlignmentCenter;
    userName.textColor=[UIColor colorWithRed:1.0f green:0.5f blue:0 alpha:1.0f];
    [userName.layer setPosition:CGPointMake(CGRectGetMidX(self.bounds), 200)];
    [self addSubview:userName];
    [self addSubview:userGroupName];
    [self addSubview:avaterImageView];
  //  [avaterImageView setImageURL:DOMAIN_CONTEXT()];
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
