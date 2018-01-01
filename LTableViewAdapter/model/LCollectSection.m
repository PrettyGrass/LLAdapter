//
//  LCollectSection.m
//  Adapter
//
//  Created by ylin.yang on 2016/7/5.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LCollectSection.h"
#import "LCollectCell.h"

@implementation LCollectSection
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.datas = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addCell:(LCollectCell *)cell {
    if (!cell) {
        return;
    }
    [self.datas addObject:cell];
}

- (__kindof LCollectCell *)addNewCell {
    return [self addNewCell:LCollectCell.class];
}
- (__kindof LCollectCell *)addNewCell:(Class)clzz {
    LCollectCell *cell = [[clzz alloc] init];
    [self addCell:cell];
    return cell;
}

@end
