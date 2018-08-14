//
//  LLTableCell.h
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLBaseCell.h"

@class LLTableCell;
typedef void (^LLTableCellAction)(__kindof LLTableCell *model, NSIndexPath *index);

/**
 *	@author Y0, 16-07-04 17:07:34
 *
 *	Table cell 数据模型
 *
 *	@since 1.0
 */
@interface LLTableCell<DataType>: LLBaseCell<DataType>

/// 行高
@property (assign, nonatomic) CGFloat cellHeight;
/// 选择的样式 默认 UITableViewCellSelectionStyleNone
@property (assign, nonatomic) UITableViewCellSelectionStyle selectionStyle;
/// 附件样式 默认 UITableViewCellAccessoryNone
@property (assign, nonatomic) UITableViewCellAccessoryType accessoryType;
/// 选择时候去选样式
@property (assign, nonatomic) LLDeSelectionStyle deSelectionStyle;
/// 行分割线样式
@property (assign, nonatomic) LLTableViewCellSeparatorStyle separatorStyle;
/// 行分割线颜色
@property (strong, nonatomic) UIColor *separatorColor;
/// 选中时颜色
@property (strong, nonatomic) UIColor *selectionColor;
/// 分割线的位置
@property (nonatomic) UIEdgeInsets separatorInset;

/// 点击事件 DataType 为 data 类型
@property (copy, nonatomic) void (^cellClick)(__kindof LLTableCell <DataType> *model, NSIndexPath *index);

/**
 ============================================================
 默认cell 字段内容,未完全实现, 如有需要可自行实现或者使用kvcExt替代,
 自定义cell可忽略以下字段
 ============================================================
 */
/// 标题
@property (copy, nonatomic) NSString *text;
/// 子标题
@property (copy, nonatomic) NSString *detailText;
/// 图片  内置图片名 或 UIImage *
@property (assign, nonatomic) id image;

@end
