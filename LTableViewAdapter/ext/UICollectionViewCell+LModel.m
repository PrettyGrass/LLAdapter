//
//  UICollectionViewCell+LModel.m
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "UICollectionViewCell+LModel.h"
#import <objc/runtime.h>

static NSString *collmodelkey = @"collmodelkey";
@implementation UICollectionViewCell (LModel)

- (void)setModel:(LCollectCell *)model {
    objc_setAssociatedObject(self, &collmodelkey, model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self updateCellUI];
}

- (LCollectCell *)model {
    
    return objc_getAssociatedObject(self, &collmodelkey);
}

- (void)updateCellUI {
    __weak typeof(self) weakSelf = self;
    /// 透传数据
    [self.model.kvcExt enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [weakSelf setValue:obj forKeyPath:key];
    }];
}

@end
