//
//  LLTableSection.h
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLBaseSection.h"

@class LLTableCell;
/**
 *	@author Y0, 16-07-04 17:07:59
 *
 *	tableView section 模型
 *
 *	@since 1.0
 */
@interface LLTableSection : LLBaseSection

/// section Header高
@property (assign, nonatomic) CGFloat sectionHeaderHeight;
/// section Footer高
@property (assign, nonatomic) CGFloat sectionFooterHeight;

///组头
@property (nonatomic, strong) UIView *sectionHeaderView;
///组尾
@property (nonatomic, strong) UIView *sectionFooterView;

@end
