//
//  LLBaseAdapter.m
//  Adapter
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LLBaseAdapter.h"
#import "LLBaseAdapter+private.h"

@implementation LLBaseAdapter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sections = [[NSMutableArray alloc] init];
        _registerViewMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)reloadData {
    
}

/// 快捷构建添加一个section
- (LLBaseSection *)buildAddNewSection {
    NSAssert(false, @"子类需要覆盖该实现方法, [LLBaseAdapter builderAddNewSection]");
    return nil;
};
/// 快捷构建添加一个指定类型的section
- (LLBaseSection *)buildAddNewSection:(Class)clazz {
    if (!clazz) {
        return nil;
    }
    LLBaseSection *section = [[clazz alloc] init];
    [self addSection:section];
    return section;
};

/// 添加section
- (void)addSection:(LLBaseSection *)section {
    [self insertSection:section index:self.sections.count];
};

/// 插入section
- (void)insertSection:(LLBaseSection *)section index:(NSInteger)index {
    if (!section) {
        return;
    }
    index = MAX(index, 0); ///< 小于0 情况, 插入开头位置
    index = MIN(index, self.sections.count); ///< 越界 情况, 插入末尾位置
    [self.sections insertObject:section atIndex:index];
};
/// 移除指定位置的cell
- (void)removeSectionAtIndex:(NSInteger)index {
    
};
/// 移除指定的cell
- (void)removeSection:(LLBaseSection *)cell {
    
}

@end
