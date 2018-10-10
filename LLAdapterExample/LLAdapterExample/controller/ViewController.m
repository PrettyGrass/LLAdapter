//
//  ViewController.m
//  LLAdapterExample
//
//  Created by ylin on 17/3/6.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "ViewController.h"
#import <LLAdapter/LLAdapter.h>
#import "SimpleTableViewController.h"
#import "CustomTableViewController.h"
#import "EditTableViewController.h"
#import "CollectionController.h"
#import "SectionTitleController.h"


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
        section = [self.adapter buildAddNewSection];
    }
    
    {
        /// 头
        LLTableSectionReusableCell *simpleCell = [[LLTableSectionReusableCell alloc] init];
        simpleCell.data = [NSDictionary dictionary];
        simpleCell.cellClazz = UITableViewHeaderFooterView.class;
        simpleCell.loadType = LLCellLoadTypeOri;
        simpleCell.cellHeight = 60;
        simpleCell.text = @"头部需要继承UITableViewHeaderFooterView ";
        section.headerCell = simpleCell;
    }
    
    {
        /// 尾
        LLTableSectionReusableCell *simpleCell = [[LLTableSectionReusableCell alloc] init];
        simpleCell.data = [NSDictionary dictionary];
        simpleCell.cellClazz = UITableViewHeaderFooterView.class;
        simpleCell.loadType = LLCellLoadTypeOri;
        simpleCell.cellHeight = 32;
        simpleCell.text = @"实现 - (void)ll_updateCellUI 方法";
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
    
    LLTableCell *sectionTitleCell = [section buildAddCell];
    sectionTitleCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
        SectionTitleController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SectionTitleController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    sectionTitleCell.loadType = LLCellLoadTypeInner;
    sectionTitleCell.text = @"sectionHeaderTitle and sectionFooterTitle";
    
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
