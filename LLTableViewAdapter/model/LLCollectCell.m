//
//  LLCollectCell.m
//  Adapter
//
//  Created by ylin.yang on 2016/7/5.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LLCollectCell.h"

@implementation LLCollectCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellClazz = [UICollectionViewCell class];
    }
    return self;
}

@end
