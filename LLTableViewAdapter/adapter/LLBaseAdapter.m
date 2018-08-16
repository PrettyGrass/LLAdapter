//
//  LLBaseAdapter.m
//  Adapter
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LLBaseAdapter.h"
#import "LLBaseAdapter+private.h"

@implementation LLBaseAdapter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sections = [[NSMutableArray alloc] init];
        _registerViewMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)reloadData {
    
}

@end
