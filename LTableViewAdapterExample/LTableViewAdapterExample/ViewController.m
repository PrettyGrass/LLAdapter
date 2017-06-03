//
//  ViewController.m
//  LTableViewAdapterExample
//
//  Created by ylin on 17/3/6.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "ViewController.h"
#import <LTableViewAdapter/LTableViewAdapter.h>
#import "SimpleTableViewController.h"
#import "CustomTableViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) TableViewAdapter *adapter;
@end

@implementation ViewController

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
    
    TableCell *simpleCell = [section addNewCell];
    
    simpleCell.cellClick = ^(TableCell *cell, NSIndexPath *indexPath) {
        SimpleTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SimpleTableViewController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    simpleCell.loadType = CellLoadTypeInner;
    simpleCell.title = @"简单";
    
    TableCell *customCell = [section addNewCell];
    customCell.cellClick = ^(TableCell *cell, NSIndexPath *indexPath) {
        CustomTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CustomTableViewController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    customCell.loadType = CellLoadTypeInner;
    customCell.title = @"自定义";

    [self.adapter reloadData];
}

@end
