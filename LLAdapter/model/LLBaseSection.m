//
//  LLBaseSection.m
//  Pods
//
//  Created by ylin.yang on 2018/8/11.
//

#import "LLBaseSection.h"

@implementation LLBaseSection

- (instancetype)init {
    self = [super init];
    if (self) {
        _datas = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addCell:(LLBaseCell *)cell {
    [self insertCell:cell index:self.datas.count];
}

- (void)insertCell:(LLBaseCell *)cell index:(NSInteger)index {
    if (!cell) {
        return;
    }
    index = MAX(index, 0); ///< 小于0 情况, 插入开头位置
    index = MIN(index, self.datas.count); ///< 越界 情况, 插入末尾位置
    [self.datas insertObject:cell atIndex:index];
}

/// 移除指定位置的cell
- (void)removeCellAtIndex:(NSInteger)index {
    if ((index > self.datas.count - 1) || (index < 0)) {
        return;
    }
    [self.datas removeObjectAtIndex:index];
}

/// 移除指定的cell
- (void)removeCell:(LLBaseCell *)cell {
    [self.datas removeObject:cell];
}

- (LLBaseCell *)buildAddCell {
    NSAssert(false, @"子类需要覆盖该实现方法, [LLBaseSection buildAddCell]");
    return nil;
}

- (LLBaseCell *)buildAddCell:(Class)clazz {
    LLBaseCell *cell = [[clazz alloc] init];
    [self addCell:cell];
    return cell;
}

/// 清除datas
- (void)clearCells {
    [self.datas removeAllObjects];
}

@end
