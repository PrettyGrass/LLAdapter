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
    }
    return self;
}

- (LLBaseCell *)buildAddCell {
    return [self buildAddCell:LLCollectCell.class];
}

@end
