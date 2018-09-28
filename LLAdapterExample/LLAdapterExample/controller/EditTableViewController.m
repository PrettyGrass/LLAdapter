//
//  EditTableViewController.m
//  LLAdapterExample
//
//  Created by ylin.yang on 2017/6/7.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "EditTableViewController.h"
#import <LLAdapter/LLAdapter.h>
#import "CustomCellView.h"

@interface EditTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) LLTableViewAdapter *adapter;

@end

@implementation EditTableViewController

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
        section = [self.adapter buildAddNewSection];
    }
    {
        LLTableCell *simpleCell = [section buildAddCell];
        simpleCell.separatorStyle = LLTableViewCellSeparatorStyleCustom;
        simpleCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.loadType = LLCellLoadTypeInner;
        simpleCell.text = @"简单";
    }
    for (int i = 0; i < 1000; i ++) {
        LLTableCell *customCell = [section buildAddCell:LLTableCell.class];
        customCell.separatorStyle = LLTableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor clearColor] forKey:@"backgroundColor"];
        if (i % 2) {
            [customCell.kvcExt setObject:[UIColor orangeColor] forKey:@"contentView.backgroundColor"];
        } else {
            [customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        }
        customCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        customCell.loadType = LLCellLoadTypeInner;
        customCell.text = [NSString stringWithFormat:@"自定义:%d", i];
    }
    [self.adapter reloadData];
}

@end
