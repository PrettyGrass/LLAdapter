//
//  LLCollectSection.m
//  Adapter
//
//  Created by ylin.yang on 2016/7/5.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LLCollectSection.h"
#import "LLCollectCell.h"

@implementation LLCollectSection
- (instancetype)init
{
    self = [super init];
    if (self) {
        _datas = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addCell:(LLCollectCell *)cell {
    if (!cell) {
        return;
    }
    [self.datas addObject:cell];
}

- (__kindof LLCollectCell *)addNewCell {
    return [self addNewCell:LLCollectCell.class];
}

- (__kindof LLCollectCell *)addNewCell:(Class)clzz {
    LLCollectCell *cell = [[clzz alloc] init];
    [self addCell:cell];
    return cell;
}

@end
