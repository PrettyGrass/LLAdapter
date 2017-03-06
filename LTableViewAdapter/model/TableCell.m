//
//  TableCell.m
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        _cellHeight = 44;//UITableViewAutomaticDimension
        _cellClazz = [UITableViewCell class];
        _kvcExt = [NSMutableDictionary dictionary];
    }
    return self;
}
@end
