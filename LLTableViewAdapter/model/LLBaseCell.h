//
//  LLBaseCell.h
//  LLTableViewAdapter
//
//  Created by ylin.yang on 2018/8/11.
//

#import <Foundation/Foundation.h>
#import "LLTabbleViewDefine.h"

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

/**
 基础cell
 */
@interface LLBaseCell <LLCellDataType>: NSObject

/// kvc 透传数据
@property (strong, nonatomic) NSMutableDictionary *kvcExt;
/// 行索引信息
@property (weak, nonatomic) NSIndexPath *indexPath;
/// cell类
@property (assign, nonatomic) Class cellClazz;
/// cell 重用id 默认是 cellClazz类的类名
@property (copy, nonatomic) NSString *cellIdentity;
/// cell 默认是 cellClazz类的类名
@property (copy, nonatomic) NSString *cellNibName;
/// cell加载类型 默认 LLCellLoadTypeInner
@property (assign, nonatomic) LLCellLoadType loadType;

/// 数据
@property (strong, nonatomic) LLCellDataType data;

@end
