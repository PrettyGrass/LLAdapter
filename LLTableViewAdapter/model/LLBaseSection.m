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
    if (!cell) {
        return;
    }
    [self.datas addObject:cell];
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
