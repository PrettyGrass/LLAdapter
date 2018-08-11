//
//  ViewController.m
//  LLTableViewAdapterExample
//
//  Created by ylin on 17/3/6.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "ViewController.h"
#import <LLTableViewAdapter/LLAdapter.h>
#import "SimpleTableViewController.h"
#import "CustomTableViewController.h"
#import "EditTableViewController.h"
#import "CollectionController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) LLTableViewAdapter *adapter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
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
    
    LLTableCell *simpleCell = [section addNewCell];
    simpleCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
        SimpleTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SimpleTableViewController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    simpleCell.loadType = LLCellLoadTypeInner;
    simpleCell.text = @"简单";
    
    LLTableCell *customCell = [section addNewCell];
    customCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
        CustomTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CustomTableViewController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    customCell.loadType = LLCellLoadTypeInner;
    customCell.text = @"自定义";
    
    LLTableCell *editCell = [section addNewCell];
    editCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
        EditTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"EditTableViewController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    editCell.loadType = LLCellLoadTypeInner;
    editCell.text = @"编辑";
    
    LLTableCell *collectCell = [section addNewCell];
    collectCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
        CollectionController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CollectionController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    collectCell.loadType = LLCellLoadTypeInner;
    collectCell.text = @"collectCell";

    [self.adapter reloadData];
}

@end
