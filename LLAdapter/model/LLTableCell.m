//
//  LLTableCell.m
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LLTableCell.h"

@interface LLTableCell ()

/// 行原始生frame
@property (assign, nonatomic) CGRect cellOriFrame;

@end

@implementation LLTableCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellClazz = [UITableViewCell class];
        _cellHeight = UITableViewAutomaticDimension;
        _separatorStyle = LLTableViewCellSeparatorStyleInner;
        _separatorInset = UIEdgeInsetsMake(0, 24, 0, 0);
        _selectionStyle = UITableViewCellSelectionStyleDefault;
        _selectionColor = [UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0];
        _deSelectionStyle = LLDeSelectionStyleNow;
    }
    return self;
}
@end
