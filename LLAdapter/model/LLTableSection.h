//
//  LLTableSection.h
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLBaseSection.h"
#import "LLTableCell.h"
#import "LLTableSectionReusableCell.h"

/**
 *	@author Y0, 16-07-04 17:07:59
 *
 *	tableView section 模型
 *
 *	@since 1.0
 */
@interface LLTableSection<LLCellType: LLTableCell*, LLHeaderType: LLTableSectionReusableCell*, LLFooterType: LLTableSectionReusableCell*>: LLBaseSection<LLCellType, LLHeaderType, LLFooterType>

@property (nonatomic, copy) NSString *sectionHeaderTitle; ///< 组头标题 在组视图头部用LLTableCell的形式加载时无效
@property (nonatomic, copy) NSString *sectionFooterTitle; ///< 组尾标题 在组视图尾部用LLTableCell的形式加载时无效
@property (nonatomic, assign) CGFloat sectionHeaderTitleHeight; ///< 组头标题高度
@property (nonatomic, assign) CGFloat sectionFooterTitleHeight; ///< 组尾标题高度

@end
