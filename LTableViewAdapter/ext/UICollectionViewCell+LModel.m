//
//  UICollectionViewCell+LModel.m
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "UICollectionViewCell+LModel.h"
#import <objc/runtime.h>

static NSString *collmodelkey = @"collmodelkey";
@implementation UICollectionViewCell (Model)

- (void)setModel:(LCollectCell *)model {
    objc_setAssociatedObject(self, &collmodelkey, model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self updateUI];
}

- (LCollectCell *)model {
    
    return objc_getAssociatedObject(self, &collmodelkey);
}

- (void)updateUI {
    __weak typeof(self) weakSelf = self;
    /// 透传数据
    [self.model.kvcExt enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [weakSelf setValue:obj forKeyPath:key];
    }];
}

@end
