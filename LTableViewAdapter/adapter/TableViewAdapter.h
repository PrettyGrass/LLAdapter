//
//  TableViewAdapter.h
//  GetTV_iOS
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "BaseAdapter.h"
@class TableSection;

/**
 *	@author Y0, 16-07-06 16:07:19
 *
 *	TableView数据适配器
 *
 *	@since 1.0
 */
@interface TableViewAdapter : BaseAdapter<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray <TableSection *>* sections;
@property (weak, nonatomic) id<UITableViewDelegate> tableViewDelegate;
@property (assign, nonatomic) id<UITableViewDataSource> dataSourceDelegate;

@end
