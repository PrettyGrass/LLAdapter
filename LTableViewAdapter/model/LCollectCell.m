//
//  LCollectCell.m
//  Adapter
//
//  Created by ylin.yang on 2016/7/5.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LCollectCell.h"

@implementation LCollectCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellClazz = [UICollectionViewCell class];
        _kvcExt = [NSMutableDictionary dictionary];
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
