//
//  LTableSection.h
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTableCell;
/**
 *	@author Y0, 16-07-04 17:07:59
 *
 *	tableView section 模型
 *
 *	@since 1.0
 */
@interface LTableSection : NSObject

/// 标题
@property (copy, nonatomic) NSString *sectionTitle;
/// 单元的数据集合
@property (strong, nonatomic) NSMutableArray <LTableCell *>*datas;
/// section Header高
@property (assign, nonatomic) CGFloat sectionHeaderHeight;
/// section Footer高
@property (assign, nonatomic) CGFloat sectionFooterHeight;
/// section 索引
@property (assign, nonatomic) NSInteger sectionIndex;

- (void)addCell:(__kindof LTableCell *)cell;
- (__kindof LTableCell *)addNewCell;
- (__kindof LTableCell *)addNewCell:(Class)clzz;

@end
