//
//  LBaseAdapter.m
//  Adapter
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LBaseAdapter.h"

@implementation LBaseAdapter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sections = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)reloadData {
    
}

@end
