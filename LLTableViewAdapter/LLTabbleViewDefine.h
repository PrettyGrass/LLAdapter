//
//  LLTabbleViewDefine.h
//  Pods
//
//  Created by ylin on 17/3/8.
//
//

#ifndef LLTabbleViewDefine_h
#define LLTabbleViewDefine_h

/// cell事件定义block
#define LLTableCellActionDefine(_name_, _type_) void(^_name_)(__kindof LLTableCell <_type_>*model, NSIndexPath *index);

#define LLCollectCellActionDefine(_name_, _type_) void(^_name_)(__kindof LLCollectCell <_type_>*model, NSIndexPath *index);


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

#endif /* LLTabbleViewDefine_h */
