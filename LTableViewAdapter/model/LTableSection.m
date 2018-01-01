//
//  LTableSection.m
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LTableSection.h"
#import "LTableCell.h"

@implementation LTableSection

- (instancetype)init {
    self = [super init];
    if (self) {
        _datas = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addCell:(__kindof LTableCell *)cell {
    if (!cell) {
        return;
    }
    [self.datas addObject:cell];
}

- (__kindof LTableCell *)addNewCell {
    return [self addNewCell:LTableCell.class];
}

- (__kindof LTableCell *)addNewCell:(Class)clzz {
    LTableCell *cell = [[clzz alloc] init];
    [self addCell:cell];
    return cell;
}

@end
