//
//  LLBaseSection.h
//  Pods
//
//  Created by ylin.yang on 2018/8/11.
//

#import <Foundation/Foundation.h>
@class LLBaseCell;
@interface LLBaseSection <LLCellType: LLBaseCell*>: NSObject

/// 单元的数据集合
@property (strong, nonatomic) NSMutableArray <LLCellType> *datas;
/// section 索引
@property (assign, nonatomic) NSInteger sectionIndex;
/// 单元标题
@property (copy, nonatomic) NSString *sectionTitle;

/// 添加一个行对象
- (void)addCell:(LLCellType)cell;
/// 构建并添加默认cell对象
- (LLCellType)buildAddCell;
/// 构建并添加指定类型cell对象
- (LLCellType)buildAddCell:(Class)clazz;

@end
