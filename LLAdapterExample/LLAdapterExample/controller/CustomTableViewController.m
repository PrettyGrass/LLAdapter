//
//  CustomTableViewController.m
//  LLAdapterExample
//
//  Created by ylin on 17/3/8.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "CustomTableViewController.h"
#import <LLAdapter/LLAdapter.h>
#import "SimpleCellView.h"

@interface CustomTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) LLTableViewAdapter *adapter;

@end

@implementation CustomTableViewController

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
        LLTableCell *simpleCell = [section buildAddCell:LLTableCell.class];
        simpleCell.separatorStyle = LLTableViewCellSeparatorStyleCustom;
        simpleCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.loadType = LLCellLoadTypeInner;
        simpleCell.text = @"简单";
    }
    {
        LLTableCell *customCell = [section buildAddCell:LLTableCell.class];
        customCell.separatorStyle = LLTableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor clearColor] forKey:@"backgroundColor"];
        [customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(LLTableCell *model, NSIndexPath *index) {
        };
        customCell.loadType = LLCellLoadTypeInner;
        customCell.text = @"自定义";
    }
    
    {
        LLTableCell *customCell = [section buildAddCell:LLTableCell.class];
        customCell.loadType = LLCellLoadTypeInner;
        customCell.cellClazz = SimpleCellView.class;
        customCell.cellHeight = 140;
        customCell.separatorStyle = LLTableViewCellSeparatorStyleNone;
        customCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [customCell.kvcExt setObject:[UIColor orangeColor] forKey:@"backgroundColor"];
        customCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        void(^btnAction)(LLTableCell *cell, NSIndexPath *indexPath) = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"cell消息:%@", cell.text] message:@"按钮" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] show];
        };
        [customCell.kvcExt setObject:btnAction forKey:@"cellBtnClick"];
        customCell.text = @"有按钮事件";
    }
    {
        LLTableCell *customCell = [section buildAddCell:LLTableCell.class];
        customCell.cellHeight = 88;
        customCell.separatorStyle = LLTableViewCellSeparatorStyleCustom;
        [customCell.kvcExt setObject:[UIColor clearColor] forKey:@"backgroundColor"];
        [customCell.kvcExt setObject:[UIColor redColor] forKey:@"contentView.backgroundColor"];
        customCell.cellClick = ^(LLTableCell *cell, NSIndexPath *indexPath) {
            
        };
        customCell.loadType = LLCellLoadTypeInner;
        customCell.text = @"上边距";
    }
    [self.adapter reloadData];
}

@end
