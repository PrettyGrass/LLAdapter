//
//  SectionTitleController.m
//  LLAdapterExample
//
//  Created by renxun on 2018/10/9.
//  Copyright © 2018 ylin.yang. All rights reserved.
//

#import "SectionTitleController.h"
#import <LLAdapter/LLAdapter.h>


@interface SectionTitleController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) LLTableViewAdapter *adapter;

@end

@implementation SectionTitleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ///初始化适配器
    LLTableViewAdapter *adapter = [[LLTableViewAdapter alloc] initWithTableView:self.tableView];
    //可以右侧实现标题 a,b,c,d
    adapter.dataSourceDelegate = self;

    self.adapter = adapter;
    [self _testAdaptTitle];
}

- (void)_testAdaptTitle {
    
    ///设置数据
    LLTableSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [self.adapter buildAddNewSection];
    }
    section.sectionHeaderTitle = @"组1头部标题30高度";
    section.sectionFooterTitle = @"组1尾部标题30高度";
    
    section.sectionHeaderTitleHeight = 30;
    section.sectionFooterTitleHeight = 30;
    
    [self _buildCellWithSection:section];
    [self _buildCellWithSection:section];

    LLTableSection *section1 = [self.adapter buildAddNewSection];
    section1.sectionHeaderTitle = @"组2头部标题50高度";
    section1.sectionFooterTitle = @"组2尾部标题50高度";
    section1.sectionHeaderTitleHeight = 50;
    section1.sectionFooterTitleHeight = 50;
    
    [self _buildCellWithSection:section1];
    [self _buildCellWithSection:section1];
}

- (LLTableCell *)_buildCellWithSection:(LLTableSection *)section {
    LLTableCell *simpleCell = [section buildAddCell];
    simpleCell.loadType = LLCellLoadTypeInner;
    simpleCell.text = @"内容内容..";
    return simpleCell;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return @[@"1",@"2"];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return title.integerValue;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@",indexPath);
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSLog(@"sourceIndexPath:%@ -> destinationIndexPath:%@",sourceIndexPath,destinationIndexPath);
}

@end
