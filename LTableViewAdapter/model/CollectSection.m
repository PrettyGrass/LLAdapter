//
//  CollectSection.m
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/7/5.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "CollectSection.h"
#import "CollectCell.h"

@implementation CollectSection
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.datas = [[NSMutableArray alloc] init];
    }
    return self;
}

- (CollectCell *)addNewCell {
    return [self addNewCell:CollectCell.class];
}
- (__kindof CollectCell *)addNewCell:(Class)clzz {
    CollectCell *cell = [[clzz alloc] init];
    [self.datas addObject:cell];
    return cell;
}

@end
