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
#import "TableViewHeaderFooter.h"

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
    
    {
        /// 头
        LLTableCell <NSDictionary *>*simpleCell = [[LLTableCell alloc] init];
        simpleCell.data = [NSDictionary dictionary];
        simpleCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.text = @"头头头头头头头头头头头头";
        simpleCell.detailText = @"头头头头头头头头头头头头detailText";
        simpleCell.cellClazz = UITableViewHeaderFooterView.class;
        simpleCell.loadType = LLCellLoadTypeOri;
        simpleCell.cellHeight = 60;
        
        section.headerCell = simpleCell;
        
    }
    
    {
        /// 尾
        LLTableCell <NSDictionary *>*simpleCell = [[LLTableCell alloc] init];
        simpleCell.data = [NSDictionary dictionary];
        simpleCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.text = @"尾尾尾尾尾尾尾尾尾尾尾尾尾尾尾尾尾尾";
        simpleCell.detailText = @"尾尾尾尾尾尾尾尾尾尾尾尾尾尾尾尾detailText";
        simpleCell.cellClazz = UITableViewHeaderFooterView.class;
        simpleCell.loadType = LLCellLoadTypeOri;
        simpleCell.cellHeight = 32;
        
        section.footerCell = simpleCell;
        
    }
    
    LLTableCell *simpleCell = [section buildAddCell];
    simpleCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
        SimpleTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SimpleTableViewController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    simpleCell.loadType = LLCellLoadTypeInner;
    simpleCell.text = @"简单";
    
    LLTableCell *customCell = [section buildAddCell];
    customCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
        CustomTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CustomTableViewController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    customCell.loadType = LLCellLoadTypeInner;
    customCell.text = @"自定义";
    
    LLTableCell *editCell = [section buildAddCell];
    editCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
        EditTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"EditTableViewController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    editCell.loadType = LLCellLoadTypeInner;
    editCell.text = @"编辑";
    
    LLTableCell *collectCell = [section buildAddCell];
    collectCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
        CollectionController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CollectionController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    collectCell.loadType = LLCellLoadTypeInner;
    collectCell.text = @"collectCell";

    [self.adapter reloadData];
}

@end
