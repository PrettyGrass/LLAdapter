//
//  LTableSection.m
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LTableSection.h"
#import "LTableCell.h"

@implementation LTableSection
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.datas = [[NSMutableArray alloc] init];
    }
    return self;
}

- (__kindof LTableCell *)addNewCell {
    LTableCell *cell = [[LTableCell alloc] init];
    [self.datas addObject:cell];
    return cell;
}
- (__kindof LTableCell *)addNewCell:(Class)clzz {
    LTableCell *cell = [[clzz alloc] init];
    [self.datas addObject:cell];
    return cell;
}

@end
