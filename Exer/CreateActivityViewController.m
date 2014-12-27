//
//  CreateActivityViewController.m
//  ezoom
//
//  Created by jax chow on 12/26/14.
//  Copyright (c) 2014 JaxTeam. All rights reserved.
//

#import "CreateActivityViewController.h"
#import "ItemViewController.h"
#import "RETableViewOptionsController.h"

@interface CreateActivityViewController ()

@property (strong, readwrite, nonatomic) RETextItem *actTitleItem;
@property (strong, readwrite, nonatomic) REDateTimeItem *actCreateTimeItem;
@property (strong, readwrite, nonatomic) RERadioItem *actTypeItem;
@property (strong, readwrite, nonatomic) RETextItem *actAddressItem;
@property (strong, readwrite, nonatomic) RERadioItem *actPayTypeItem;
@property (strong, readwrite, nonatomic) RETextItem *actCostItem;
@property (strong, readwrite, nonatomic) RETextItem *actCountItem;
@property (strong, readwrite, nonatomic) RETextItem *actContentItem;

@end

@implementation CreateActivityViewController

 NSMutableDictionary *formgData;

- (void)viewDidLoad {
    [super viewDidLoad];
      self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存活动" style:UIBarButtonItemStyleBordered target:self action:@selector(saveHandler:)];
      _manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    [_manager addSection:[self addFormSection]];
    [_manager addSection:[self addPaymentSection]];
    [_manager addSection:[self addAddressSection]];

}

-(void)saveHandler:(id *)sender
{
    NSLog(@"value %@",self.actTitleItem.value);
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

-(RETableViewSection *)addAddressSection{
    
    RETableViewSection *section =[RETableViewSection sectionWithHeaderTitle:@"活动地方"];
    self.actAddressItem = [RETextItem itemWithTitle:@"活动地址" value:nil placeholder:@"请输入活动地点"];
    [section addItem:self.actAddressItem];
    
    self.actContentItem = [RETextItem itemWithTitle:@"活动描述" value:nil placeholder:@"请输入活动描述"];
    [section addItem:self.actContentItem];
    
    return section;

}
-(RETableViewSection *)addPaymentSection{
    __typeof (&*self) __weak weakSelf=self;
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"支付方式"];
    
     self.actPayTypeItem = [RERadioItem itemWithTitle:@"方式类型" value:nil selectionHandler:^(RERadioItem *item) {
        [item deselectRowAnimated:YES];
        
        NSMutableArray *options = [[NSMutableArray alloc] init];
        [options addObject:[NSString stringWithFormat:@"免费"]];
        [options addObject:[NSString stringWithFormat:@"积分支付"]];
        
        
        RETableViewOptionsController *optionsController = [[RETableViewOptionsController alloc] initWithItem:item options:options multipleChoice:NO completionHandler:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
            
            [item reloadRowWithAnimation:UITableViewRowAnimationNone]; // same as [weakSelf.tableView reloadRowsAtIndexPaths:@[item.indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
        
        optionsController.delegate = weakSelf;
        optionsController.style = section.style;
        if (weakSelf.tableView.backgroundView == nil) {
            optionsController.tableView.backgroundColor = weakSelf.tableView.backgroundColor;
            optionsController.tableView.backgroundView = nil;
        }
        
        // Push the options controller
        //
        [weakSelf.navigationController pushViewController:optionsController animated:YES];
    }];
    [section addItem:self.actPayTypeItem];
    
     self.actCostItem = [RETextItem itemWithTitle:@"支付费用" value:nil placeholder:@"请输入活动名称"];
    [section addItem:self.actCostItem];
    
    return section;

}
- (RETableViewSection *)addFormSection{
    
    __typeof (&*self) __weak weakSelf=self;
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"活动信息"];
   

    self.actTitleItem = [RETextItem itemWithTitle:@"活动名称" value:nil placeholder:@"请输入活动名称"];
    [section addItem:self.actTitleItem];
    
    RERadioItem *actTypeItem= [RERadioItem itemWithTitle:@"活动类型" value:nil selectionHandler:^(RERadioItem *item) {
        [item deselectRowAnimated:YES];
        
        NSMutableArray *options = [[NSMutableArray alloc] init];
        [options addObject:[NSString stringWithFormat:@"聚会"]];
        [options addObject:[NSString stringWithFormat:@"自驾游"]];
        
        
        RETableViewOptionsController *optionsController = [[RETableViewOptionsController alloc] initWithItem:item options:options multipleChoice:NO completionHandler:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
            
            [item reloadRowWithAnimation:UITableViewRowAnimationNone]; // same as [weakSelf.tableView reloadRowsAtIndexPaths:@[item.indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
        
        optionsController.delegate = weakSelf;
        optionsController.style = section.style;
        if (weakSelf.tableView.backgroundView == nil) {
            optionsController.tableView.backgroundColor = weakSelf.tableView.backgroundColor;
            optionsController.tableView.backgroundView = nil;
        }
        
        // Push the options controller
        //
        [weakSelf.navigationController pushViewController:optionsController animated:YES];
    }];
    [section addItem:actTypeItem];

    
     self.actCreateTimeItem = [REDateTimeItem itemWithTitle:@"活动日期" value:nil placeholder:@"请选择出生日期" format:@"yyyy-MM-dd" datePickerMode:UIDatePickerModeDate];
    [section addItem:self.actCreateTimeItem];
    
    self.actCountItem = [RETextItem itemWithTitle:@"参于人数" value:nil placeholder:@""];
    [section addItem:self.actCountItem];
    

    
    
    return section;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
