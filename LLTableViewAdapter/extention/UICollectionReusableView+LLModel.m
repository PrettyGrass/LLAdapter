//
//  UICollectionReusableView+LLModel.m
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "UICollectionReusableView+LLModel.h"
#import <objc/runtime.h>

static NSString *colLLModelkey = @"UICollectionReusableView+Modelkey";
@implementation UICollectionReusableView (LLModel)

- (void)setLl_model:(LLCollectCell *)ll_model {
    objc_setAssociatedObject(self, &colLLModelkey, ll_model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self ll_updateCellUI];
}

- (LLCollectCell *)ll_model {
    
    return objc_getAssociatedObject(self, &colLLModelkey);
}

- (void)ll_updateCellUI {
    __weak typeof(self) weakSelf = self;
    /// 透传数据
    [self.ll_model.kvcExt enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [weakSelf setValue:obj forKeyPath:key];
    }];
}

@end
