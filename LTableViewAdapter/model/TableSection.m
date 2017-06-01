//
//  TableSection.m
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "TableSection.h"
#import "TableCell.h"

@implementation TableSection
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.datas = [[NSMutableArray alloc] init];
    }
    return self;
}

- (TableCell *)addNewCell {
    TableCell *cell = [[TableCell alloc] init];
    [self.datas addObject:cell];
    return cell;
}
- (TableCell *)addNewCell:(Class)clzz {
    TableCell *cell = [[clzz alloc] init];
    [self.datas addObject:cell];
    return cell;
}

@end
