//
//  CustomTableViewController.m
//  LLTableViewAdapterExample
//
//  Created by ylin on 17/3/8.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "CustomTableViewController.h"
#import <LLTableViewAdapter/LLTableViewAdapter.h>
#import "KVLLTableCell.h"
#import "CustomCellView.h"

@interface CustomTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) LLTableViewAdapter *adapter;

@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    //self.view.backgroundColor = [UIColor lightGrayColor];
    //self.simpleTable.backgroundColor = [UIColor clearColor];
    ///初始化适配器
    LLTableViewAdapter *adapter = [[LLTableViewAdapter alloc] initWithTableView:self.simpleTable];
    self.adapter = adapter;
    
    self.simpleTable.estimatedRowHeight = 44;
    self.simpleTable.rowHeight = UITableViewAutomaticDimension;
    ///设置数据
    
    LLTableSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [self.adapter addNewSection];
    }
    {
        KVLLTableCell *simpleCell = [section addNewCell];
        simpleCell.separatorStyle = LLTableViewCellSeparatorStyleCustom;
        simpleCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.loadType = LLCellLoadTypeInner;
        simpleCell.title = @"简单";
    }
    {
        LLTableCell *customCell = [section addNewCell:KVLLTableCell.class];
        customCell.separatorStyle = LLTableViewCellSeparatorStyleCustom;
        //customCell.selectionStyle = UITableViewCellSelectionStyleDefault;
        [customCell.kvcExt setObject:[UIColor clearColor] forKey:@"backgroundColor"];
        [customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        customCell.loadType = LLCellLoadTypeInner;
        customCell.title = @"自定义";
    }
    
    {
        LLTableCell *customCell = [section addNewCell:KVLLTableCell.class];
        customCell.cellHeight = 88;
        customCell.separatorStyle = LLTableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor clearColor] forKey:@"backgroundColor"];
        //[customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        customCell.cellSpaceMargin = UIEdgeInsetsMake(0, 0, 20, 0);
        customCell.loadType = LLCellLoadTypeInner;
        customCell.title = @"下边距";
    }
    {
        LLTableCell *customCell = [section addNewCell:KVLLTableCell.class];
        customCell.loadType = LLCellLoadTypeNib;
        //customCell.selectionStyle = UITableViewCellSelectionStyle;
        customCell.cellClazz = CustomCellView.class;
        customCell.cellHeight = 140;
        customCell.separatorStyle = LLTableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor blueColor] forKey:@"backgroundColor"];
        [customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        customCell.cellSpaceMargin = UIEdgeInsetsMake(20, 20, 20, 20);
        customCell.title = @"上下下边距";
    }
    {
        LLTableCell *customCell = [section addNewCell:KVLLTableCell.class];
        customCell.cellHeight = 88;
        customCell.separatorStyle = LLTableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor clearColor] forKey:@"backgroundColor"];
        [customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        customCell.cellSpaceMargin = UIEdgeInsetsMake(20, 0, 0, 0);
        customCell.loadType = LLCellLoadTypeInner;
        customCell.title = @"上边距";
    }
    [self.adapter reloadData];
}

@end
