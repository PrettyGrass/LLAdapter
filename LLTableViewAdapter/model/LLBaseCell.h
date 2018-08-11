//
//  LLBaseCell.h
//  LLTableViewAdapter
//
//  Created by ylin.yang on 2018/8/11.
//

#import <Foundation/Foundation.h>
#import "LLTabbleViewDefine.h"

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
