//
//  LTableCell.m
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LTableCell.h"

@interface LTableCell ()

/// 行原始生frame
@property (assign, nonatomic) CGRect cellOriFrame;

@end

@implementation LTableCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        _cellHeight = UITableViewAutomaticDimension;
        _cellClazz = [UITableViewCell class];
        _kvcExt = [NSMutableDictionary dictionary];
        _separatorStyle = LTableViewCellSeparatorStyleInner;
        _separatorInset = UIEdgeInsetsMake(0, 24, 0, 0);
        _selectionStyle = UITableViewCellSelectionStyleDefault;
        _selectionColor = [UIColor colorWithRed:299.0/255.0 green:299.0/255.0 blue:299.0/255.0 alpha:1.0];
        _LDeSelectionStyle = LDeSelectionStyleNow;
    }
    return self;
}

- (NSString *)cellIdentity {
    
    if (_cellIdentity) {
        return _cellIdentity;
    }
    NSString *val = NSStringFromClass(self.cellClazz);
    
    return val;
}

- (NSString *)cellNibName {
    
    if (_cellNibName) {
        return _cellNibName;
    }
    NSString *val = NSStringFromClass(self.cellClazz);
    
    return val;
}

@end
