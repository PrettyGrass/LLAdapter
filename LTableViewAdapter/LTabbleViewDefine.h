//
//  LTabbleViewDefine.h
//  Pods
//
//  Created by ylin on 17/3/8.
//
//

#ifndef LTabbleViewDefine_h
#define LTabbleViewDefine_h

@class TableCell;

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


typedef void (^TableCellAction)(TableCell *model, NSIndexPath *index);

#endif /* LTabbleViewDefine_h */
