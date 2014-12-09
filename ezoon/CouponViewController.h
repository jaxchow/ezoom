//
//  CouponViewController.h
//  ezoon
//
//  Created by zhouhuan on 12/9/14.
//  Copyright (c) 2014 jaxteam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemViewController.h"

@interface CouponViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,
                                UISearchBarDelegate, UISearchDisplayDelegate>
{


}
- (void)openView;
- (id)initWithSectionIndexes:(BOOL)showSectionIndexes;

- (void)scrollTableViewToSearchBarAnimated:(BOOL)animated; // Implemented by the subclasses

@property(nonatomic, assign, readonly) BOOL showSectionIndexes;

@property(nonatomic, strong, readonly) UITableView *tableView;
@property(nonatomic, strong, readonly) UISearchBar *searchBar;
@end
