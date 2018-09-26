//
//  LLTableViewAdapter.h
//  Adapter
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LLBaseAdapter.h"
#import "LLTableSection.h"

/**
 *	@author Y0, 16-07-06 16:07:19
 *
 *	TableView数据适配器
 *
 *	@since 1.0
 */
@interface LLTableViewAdapter : LLBaseAdapter<LLTableSection *><UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) id<UITableViewDelegate> tableViewDelegate;
@property (weak, nonatomic) id<UITableViewDataSource> dataSourceDelegate;

- (instancetype)initWithTableView:(UITableView *)tableView;

//- (LLTableSection *)buildAddNewSection;
//- (LLTableSection *)buildAddNewSection:(Class)clazz;
//- (void)addSection:(__kindof LLTableSection *)section;

@end
