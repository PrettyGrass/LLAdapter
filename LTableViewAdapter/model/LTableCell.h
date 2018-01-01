//
//  LTableCell.h
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTabbleViewDefine.h"

@class LTableCell;

typedef NS_ENUM(NSInteger, CellLoadType) {
    CellLoadTypeInner,
    CellLoadTypeOri,
    CellLoadTypeNib
};
/// 点击后的去选风格
typedef NS_ENUM(NSInteger, DeSelectionStyle) {
    DeSelectionStyleNone,//不操作
    DeSelectionStyleNow,//立即去选择
    DeSelectionStylePersist,//永久选择
};
/// 分割线风格
typedef NS_ENUM(NSInteger, TableViewCellSeparatorStyle) {
    TableViewCellSeparatorStyleNone,//无
    TableViewCellSeparatorStyleInner,//系统内置
    TableViewCellSeparatorStyleCustom,//自定义
};

typedef void (^LTableCellAction)(__kindof LTableCell *model, NSIndexPath *index);

#define LTableCellActionDefine(_name_, _type_) void(^_name_)(__kindof LTableCell <_type_>*model, NSIndexPath *index);

/**
 *	@author Y0, 16-07-04 17:07:34
 *
 *	tableviewcell 数据模型
 *
 *	@since 1.0
 */
@interface LTableCell <DataType: NSObject *>: NSObject

/// kvc 透传数据
@property (strong, nonatomic) NSMutableDictionary *kvcExt;
/// 行索引信息
@property (weak, nonatomic) NSIndexPath *indexPath;
/// 行原始生frame
@property (assign, nonatomic) CGRect cellOriFrame;
/// 行高
@property (assign, nonatomic) CGFloat cellHeight;
/// 行上边距
@property (assign, nonatomic) UIEdgeInsets cellSpaceMargin;
/// 标题
@property (copy, nonatomic) NSString *title;
/// 子标题
@property (copy, nonatomic) NSString *subTitle;
/// 图片名字  URL UIImage
@property (assign, nonatomic) id image;
/// 点击事件
@property (copy, nonatomic) LTableCellAction cellClick;

@property (copy, nonatomic) LTableCellActionDefine(ccc, DataType);
/// cell类
@property (assign, nonatomic) Class cellClazz;
/// cell Identity
@property (copy, nonatomic) NSString *cellIdentity;
/// cell NibName
@property (copy, nonatomic) NSString *cellNibName;
/// cell加载类型
@property (assign, nonatomic) CellLoadType loadType;
/// 选择的风格
@property (assign, nonatomic) UITableViewCellSelectionStyle selectionStyle;// UITableViewCellSelectionStyleNone
/// 选择时候去选风格
@property (assign, nonatomic) DeSelectionStyle deSelectionStyle;
/// 附件风格
@property (assign, nonatomic) UITableViewCellAccessoryType accessoryType;// = UITableViewCellAccessoryNone;
/// 行分割线风格
@property (assign, nonatomic) TableViewCellSeparatorStyle separatorStyle;
/// 行分割线颜色
@property (strong, nonatomic) UIColor *separatorColor;
/// 选中时颜色
@property (strong, nonatomic) UIColor *selectionColor;
/// 分割线的位置
@property (nonatomic) UIEdgeInsets separatorInset;
/// 数据
@property (strong, nonatomic) DataType data;

@end
