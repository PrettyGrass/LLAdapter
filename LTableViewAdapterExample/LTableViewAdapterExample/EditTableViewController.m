//
//  EditTableViewController.m
//  LTableViewAdapterExample
//
//  Created by ylin.yang on 2017/6/7.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "EditTableViewController.h"
#import <LTableViewAdapter/LTableViewAdapter.h>
#import "KVLTableCell.h"
#import "CustomCellView.h"

@interface EditTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) LTableViewEditAdapter *adapter;

@end

@implementation EditTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    //self.view.backgroundColor = [UIColor lightGrayColor];
    //self.simpleTable.backgroundColor = [UIColor clearColor];
    ///初始化适配器
    LTableViewEditAdapter *adapter = [[LTableViewEditAdapter alloc] initWithTableView:self.simpleTable];
    self.adapter = adapter;
    
    self.simpleTable.estimatedRowHeight = 44;
    self.simpleTable.rowHeight = UITableViewAutomaticDimension;
    ///设置数据
    
    LTableSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [self.adapter addNewSection];
    }
    {
        KVLTableCell *simpleCell = [section addNewCell];
        simpleCell.separatorStyle = TableViewCellSeparatorStyleCustom;
        simpleCell.cellClick = ^(LTableCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.loadType = CellLoadTypeInner;
        simpleCell.title = @"简单";
    }
    {
        LTableCell *customCell = [section addNewCell:KVLTableCell.class];
        customCell.separatorStyle = TableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor clearColor] forKey:@"backgroundColor"];
        [customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(LTableCell *cell, NSIndexPath *indexPath) {
            
        };
        customCell.loadType = CellLoadTypeInner;
        customCell.title = @"自定义";
    }
    
    {
        LTableCell *customCell = [section addNewCell:KVLTableCell.class];
        customCell.cellHeight = 88;
        customCell.separatorStyle = TableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor clearColor] forKey:@"backgroundColor"];
        //[customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(LTableCell *cell, NSIndexPath *indexPath) {
            
        };
        //customCell.cellSpaceMargin = UIEdgeInsetsMake(0, 0, 20, 0);
        customCell.loadType = CellLoadTypeInner;
        customCell.title = @"下边距";
    }
    {
        LTableCell *customCell = [section addNewCell:KVLTableCell.class];
        customCell.loadType = CellLoadTypeNib;
        //customCell.selectionStyle = UITableViewCellSelectionStyle;
        customCell.cellClazz = CustomCellView.class;
        customCell.cellHeight = 140;
        customCell.separatorStyle = TableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor clearColor] forKey:@"backgroundColor"];
        //[customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(LTableCell *cell, NSIndexPath *indexPath) {
            
        };
        //customCell.cellSpaceMargin = UIEdgeInsetsMake(20, 20, 20, 20);
        customCell.title = @"上下下边距";
    }
    {
        LTableCell *customCell = [section addNewCell:KVLTableCell.class];
        customCell.cellHeight = 88;
        customCell.separatorStyle = TableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor clearColor] forKey:@"backgroundColor"];
        //[customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(LTableCell *cell, NSIndexPath *indexPath) {
            
        };
        //customCell.cellSpaceMargin = UIEdgeInsetsMake(20, 0, 0, 0);
        customCell.loadType = CellLoadTypeInner;
        customCell.title = @"上边距";
    }
    [self.adapter reloadData];
}

@end
