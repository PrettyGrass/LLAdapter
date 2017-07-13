//
//  CollectCell.m
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/7/5.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "CollectCell.h"

@implementation CollectCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellClazz = [UICollectionViewCell class];
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
