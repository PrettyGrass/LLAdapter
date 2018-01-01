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
#import "EditTableViewController.h"
#import "CollectionController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) LTableViewAdapter *adapter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    ///初始化适配器
    LTableViewAdapter *adapter = [[LTableViewAdapter alloc] initWithTableView:self.simpleTable];
    self.adapter = adapter;
    
    self.simpleTable.estimatedRowHeight = 44;
    self.simpleTable.rowHeight = UITableViewAutomaticDimension;
    ///设置数据
    
    LTableSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [self.adapter addNewSection];
    }
    
    LTableCell *simpleCell = [section addNewCell];
    
    simpleCell.cellClick = ^(LTableCell *cell, NSIndexPath *indexPath) {
        SimpleTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SimpleTableViewController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    simpleCell.loadType = CellLoadTypeInner;
    simpleCell.title = @"简单";
    
    LTableCell *customCell = [section addNewCell];
    customCell.cellClick = ^(LTableCell *cell, NSIndexPath *indexPath) {
        CustomTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CustomTableViewController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    customCell.loadType = CellLoadTypeInner;
    customCell.title = @"自定义";
    
    LTableCell *editCell = [section addNewCell];
    editCell.cellClick = ^(LTableCell *cell, NSIndexPath *indexPath) {
        EditTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"EditTableViewController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    editCell.loadType = CellLoadTypeInner;
    editCell.title = @"编辑";
    
    LTableCell *collectCell = [section addNewCell];
    collectCell.cellClick = ^(LTableCell *cell, NSIndexPath *indexPath) {
        CollectionController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CollectionController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    collectCell.loadType = CellLoadTypeInner;
    collectCell.title = @"collectCell";

    [self.adapter reloadData];
}

@end
