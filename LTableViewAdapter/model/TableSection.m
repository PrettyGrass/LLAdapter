//
//  TableSection.m
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "TableSection.h"

@implementation TableSection
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.datas = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
