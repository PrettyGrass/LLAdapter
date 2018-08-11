//
//  LLTableCell.h
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTabbleViewDefine.h"

@class LLTableCell;

/**
 cell加载类型

 - LLCellLoadTypeInner: 使用sb构建的cell使用该选项
 - LLCellLoadTypeOri: 使用纯代码构建的cell使用该选项
 - LLCellLoadTypeNib: 使用Nib构建的cell使用该选项
 */
typedef NS_ENUM(NSInteger, LLCellLoadType) {
    LLCellLoadTypeInner,
    LLCellLoadTypeOri,
    LLCellLoadTypeNib
};
/// 点击后的去选风格
typedef NS_ENUM(NSInteger, LLDeSelectionStyle) {
    LLDeSelectionStyleNone,//不操作
    LLDeSelectionStyleNow,//立即去选择
    LLDeSelectionStylePersist,//永久选择
};
/// 分割线风格
typedef NS_ENUM(NSInteger, LLTableViewCellSeparatorStyle) {
    LLTableViewCellSeparatorStyleNone,//无
    LLTableViewCellSeparatorStyleInner,//系统内置
    LLTableViewCellSeparatorStyleCustom,//自定义
};

typedef void (^LLTableCellAction)(__kindof LLTableCell *model, NSIndexPath *index);

/**
 *	@author Y0, 16-07-04 17:07:34
 *
 *	tableviewcell 数据模型
 *
 *	@since 1.0
 */
@interface LLTableCell <DataType: NSObject *>: NSObject

/// kvc 透传数据
@property (strong, nonatomic) NSMutableDictionary *kvcExt;
/// 行索引信息
@property (weak, nonatomic) NSIndexPath *indexPath;
/// 行高
@property (assign, nonatomic) CGFloat cellHeight;

/// 点击事件
@property (copy, nonatomic) LLTableCellActionDefine(cellClick, DataType);
/// cell类
@property (assign, nonatomic) Class cellClazz;
/// cell Identity
@property (copy, nonatomic) NSString *cellIdentity;
/// cell NibName
@property (copy, nonatomic) NSString *cellNibName;
/// cell加载类型
@property (assign, nonatomic) LLCellLoadType loadType;
/// 选择的风格
@property (assign, nonatomic) UITableViewCellSelectionStyle selectionStyle;// UITableViewCellSelectionStyleNone
/// 选择时候去选风格
@property (assign, nonatomic) LLDeSelectionStyle LLDeSelectionStyle;
/// 附件风格
@property (assign, nonatomic) UITableViewCellAccessoryType accessoryType;// = UITableViewCellAccessoryNone;
/// 行分割线风格
@property (assign, nonatomic) LLTableViewCellSeparatorStyle separatorStyle;
/// 行分割线颜色
@property (strong, nonatomic) UIColor *separatorColor;
/// 选中时颜色
@property (strong, nonatomic) UIColor *selectionColor;
/// 分割线的位置
@property (nonatomic) UIEdgeInsets separatorInset;
/// 数据
@property (strong, nonatomic) DataType data;


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
