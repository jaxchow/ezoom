//
//  RESegmentedItem.h
//  Exer
//
//  Created by jax chow on 12/25/14.
//  Copyright (c) 2014 Sauchye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RETableViewItem.h"

@interface RESegmentedItem : RETableViewItem

@property (assign, readwrite, nonatomic) NSString* value;
@property (copy, readwrite, nonatomic) void (^switchValueChangeHandler)(RESegmentedItem *item);

+ (instancetype)itemWithTitle:(NSString *)title value:(NSString*)value switchValueChangeHandler:(void(^)(RESegmentedItem *item))switchValueChangeHandler;
+ (instancetype)itemWithTitle:(NSString *)title value:(NSString*)value;

- (id)initWithTitle:(NSString *)title value:(NSString*)value switchValueChangeHandler:(void(^)(RESegmentedItem *item))switchValueChangeHandler;
- (id)initWithTitle:(NSString *)title value:(NSString*)value;

@end
