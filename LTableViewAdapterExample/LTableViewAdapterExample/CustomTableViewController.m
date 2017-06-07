//
//  CustomTableViewController.m
//  LTableViewAdapterExample
//
//  Created by ylin on 17/3/8.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "CustomTableViewController.h"
#import <LTableViewAdapter/LTableViewAdapter.h>
#import "KVTableCell.h"
#import "CustomCellView.h"

@interface CustomTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) TableViewAdapter *adapter;

@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.simpleTable.backgroundColor = [UIColor clearColor];
    ///初始化适配器
    TableViewAdapter *adapter = [[TableViewAdapter alloc] initWithTableView:self.simpleTable];
    self.adapter = adapter;
    
    self.simpleTable.estimatedRowHeight = 44;
    self.simpleTable.rowHeight = UITableViewAutomaticDimension;
    ///设置数据
    
    TableSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [self.adapter addNewSection];
    }
    {
        KVTableCell *simpleCell = [section addNewCell];
        simpleCell.separatorStyle = TableViewCellSeparatorStyleCustom;
        simpleCell.cellClick = ^(TableCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.loadType = CellLoadTypeInner;
        simpleCell.title = @"简单";
    }
    {
        TableCell *customCell = [section addNewCell:KVTableCell.class];
        customCell.separatorStyle = TableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor blueColor] forKey:@"backgroundColor"];
        [customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(TableCell *cell, NSIndexPath *indexPath) {
            
        };
        customCell.loadType = CellLoadTypeInner;
        customCell.title = @"自定义";
    }
    
    {
        TableCell *customCell = [section addNewCell:KVTableCell.class];
        customCell.cellHeight = 88;
        customCell.separatorStyle = TableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor blueColor] forKey:@"backgroundColor"];
        [customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(TableCell *cell, NSIndexPath *indexPath) {
            
        };
        customCell.cellSpaceMargin = UIEdgeInsetsMake(0, 0, 20, 0);
        customCell.loadType = CellLoadTypeInner;
        customCell.title = @"下边距";
    }
    {
        TableCell *customCell = [section addNewCell:KVTableCell.class];
        customCell.loadType = CellLoadTypeInner;
        customCell.cellClazz = CustomCellView.class;
        //customCell.cellHeight = 88;
        customCell.separatorStyle = TableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor orangeColor] forKey:@"backgroundColor"];
        [customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(TableCell *cell, NSIndexPath *indexPath) {
            
        };
        customCell.cellSpaceMargin = UIEdgeInsetsMake(20, 0, 20, 0);
        customCell.loadType = CellLoadTypeInner;
        customCell.title = @"上下下边距";
    }
    {
        TableCell *customCell = [section addNewCell:KVTableCell.class];
        customCell.cellHeight = 88;
        customCell.separatorStyle = TableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor blueColor] forKey:@"backgroundColor"];
        [customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(TableCell *cell, NSIndexPath *indexPath) {
            
        };
        customCell.cellSpaceMargin = UIEdgeInsetsMake(20, 0, 0, 0);
        customCell.loadType = CellLoadTypeInner;
        customCell.title = @"上边距";
    }
    [self.adapter reloadData];
}

@end
