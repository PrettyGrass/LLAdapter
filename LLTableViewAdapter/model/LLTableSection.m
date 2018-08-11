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
    }
    return self;
}

- (LLBaseCell *)buildAddCell {
    return [self buildAddCell:LLTableCell.class];
}

@end
