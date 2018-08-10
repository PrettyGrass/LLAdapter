//
//  LLTableSection.m
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LLTableSection.h"
#import "LLTableCell.h"

@implementation LLTableSection

- (instancetype)init {
    self = [super init];
    if (self) {
        _datas = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addCell:(__kindof LLTableCell *)cell {
    if (!cell) {
        return;
    }
    [self.datas addObject:cell];
}

- (__kindof LLTableCell *)addNewCell {
    return [self addNewCell:LLTableCell.class];
}

- (__kindof LLTableCell *)addNewCell:(Class)clzz {
    LLTableCell *cell = [[clzz alloc] init];
    [self addCell:cell];
    return cell;
}

@end
