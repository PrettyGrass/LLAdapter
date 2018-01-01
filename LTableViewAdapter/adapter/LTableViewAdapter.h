//
//  LTableViewAdapter.h
//  Adapter
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LBaseAdapter.h"
@class LTableSection;

/**
 *	@author Y0, 16-07-06 16:07:19
 *
 *	TableView数据适配器
 *
 *	@since 1.0
 */
@interface LTableViewAdapter : LBaseAdapter<LTableSection *><UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) UITableView *tableView;
//@property (strong, nonatomic) NSMutableArray <LTableSection *>* sections;
@property (weak, nonatomic) id<UITableViewDelegate> tableViewDelegate;
@property (assign, nonatomic) id<UITableViewDataSource> dataSourceDelegate;

- (instancetype)initWithTableView:(UITableView *)tableView;

- (LTableSection *)addNewSection;
- (LTableSection *)addNewSection:(Class)clazz;
- (void)addSection:(__kindof LTableSection *)section;

@end
