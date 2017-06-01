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

@interface CustomTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) TableViewAdapter *adapter;

@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
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
    
    KVTableCell *simpleCell = [section addNewCell];
    
    simpleCell.cellClick = ^(TableCell *cell, NSIndexPath *indexPath) {
        
    };
    simpleCell.loadType = CellLoadTypeInner;
    simpleCell.title = @"简单";
    
    TableCell *customCell = [section addNewCell];
    
    customCell.cellClick = ^(TableCell *cell, NSIndexPath *indexPath) {
        
    };
    customCell.loadType = CellLoadTypeInner;
    customCell.title = @"自定义";
    
    [self.adapter reloadData];
}

@end
