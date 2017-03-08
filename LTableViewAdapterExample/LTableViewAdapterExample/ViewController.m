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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) TableViewAdapter *adapter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    TableCell *cell = [section addNewCell];
    
    cell.cellClick = ^(TableCell *cell, NSIndexPath *indexPath) {
        SimpleTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SimpleTableViewController"];
        [self.navigationController pushViewController:vc animated:true];
    };
    cell.loadType = CellLoadTypeInner;
    //cell.cellClazz = NSClassFromString(@"SimpleCellView");
    cell.title = @"简单";
    //[cell.kvcExt setObject:[UIColor redColor] forKey:@"titleLab.textColor"];
    
    
    
    [self.adapter reloadData];
}

@end
