//
//  ViewController.m
//  LTableViewAdapterExample
//
//  Created by ylin on 17/3/6.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "ViewController.h"
#import <LTableViewAdapter/LTableViewAdapter.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) TableViewAdapter *adapter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TableViewAdapter *adapter = [[TableViewAdapter alloc] init];
    self.adapter = adapter;
    
    adapter.sections = [[NSMutableArray alloc] init];
    adapter.tableView = self.simpleTable;
    
    [self setData:@[@"dsd", @"s"] isRefresh:true];
}

- (void)setData:(NSArray <NSString *>*)datas isRefresh:(BOOL)isRefresh {
    
    TableSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [[TableSection alloc] init];
        [self.adapter.sections addObject:section];
    }
    if (isRefresh) {
        [section.datas removeAllObjects];
    }
    for (NSInteger idx = 0; idx < datas.count; idx ++) {
        TableCell *cell = [[TableCell alloc] init];
        [section.datas addObject:cell];
        
        cell.loadType = CellLoadTypeInner;
        cell.cellClazz = NSClassFromString(@"SimpleCellView");
        cell.title = datas[idx];
        [cell.kvcExt setObject:[UIColor redColor] forKey:@"titleLab.textColor"];
        
    }
    [self.adapter reloadData];
}

@end
