//
//  EditTableViewController.m
//  LLTableViewAdapterExample
//
//  Created by ylin.yang on 2017/6/7.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "EditTableViewController.h"
#import <LLTableViewAdapter/LLTableViewAdapter.h>
#import "KVLLTableCell.h"
#import "CustomCellView.h"

@interface EditTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) LLTableViewEditAdapter *adapter;

@end

@implementation EditTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    //self.view.backgroundColor = [UIColor lightGrayColor];
    //self.simpleTable.backgroundColor = [UIColor clearColor];
    ///初始化适配器
    LLTableViewEditAdapter *adapter = [[LLTableViewEditAdapter alloc] initWithTableView:self.simpleTable];
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
        simpleCell.text = @"简单";
    }
    {
        LLTableCell *customCell = [section addNewCell:KVLLTableCell.class];
        customCell.separatorStyle = LLTableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor clearColor] forKey:@"backgroundColor"];
        [customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        customCell.loadType = LLCellLoadTypeInner;
        customCell.text = @"自定义";
    }
    [self.adapter reloadData];
}

@end
