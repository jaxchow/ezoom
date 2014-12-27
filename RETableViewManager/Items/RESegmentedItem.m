//
//  RESegmentedItem.m
//  Exer
//
//  Created by jax chow on 12/25/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import "RESegmentedItem.h"

@implementation RESegmentedItem

+ (instancetype)itemWithTitle:(NSString *)title value:(NSString*)value
{
    return [[self alloc] initWithTitle:title value:value];
}

+ (instancetype)itemWithTitle:(NSString *)title value:(NSString*)value switchValueChangeHandler:(void(^)(RESegmentedItem *item))switchValueChangeHandler
{
    return [[self alloc] initWithTitle:title value:value switchValueChangeHandler:switchValueChangeHandler];
}

- (id)initWithTitle:(NSString *)title value:(NSString*)value
{
    return [self initWithTitle:title value:value switchValueChangeHandler:nil];
}

- (id)initWithTitle:(NSString *)title value:(NSString*)value switchValueChangeHandler:(void(^)(RESegmentedItem *item))switchValueChangeHandler
{
    self = [super init];
    if (!self)
        return nil;
    
    self.title = title;
    self.value = value;
    self.switchValueChangeHandler = switchValueChangeHandler;
    
    return self;
}

@end
