//
//  LLBaseAdapter.h
//  Adapter
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LLBaseSection;
/// 基础适配器
@interface LLBaseAdapter <LLSectionType: LLBaseSection *>: NSObject

@property (strong, nonatomic) NSMutableArray <LLSectionType>* sections;

/// 快捷构建添加一个section
- (LLSectionType)buildAddNewSection;
/// 快捷构建添加一个指定类型的section
- (LLSectionType)buildAddNewSection:(Class)clazz;
/// 添加section
- (void)addSection:(LLSectionType)section;
/// 插入section
- (void)insertSection:(LLSectionType)section index:(NSInteger)index;
/// 移除指定位置的cell
- (void)removeSectionAtIndex:(NSInteger)index;
/// 移除指定的cell
- (void)removeSection:(LLSectionType)cell;

/// 适配器刷新，就是更新列表
- (void)reloadData;

@end
