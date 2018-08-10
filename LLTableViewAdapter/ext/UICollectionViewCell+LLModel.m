//
//  UICollectionViewCell+LLModel.m
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "UICollectionViewCell+LLModel.h"
#import <objc/runtime.h>

static NSString *colLLModelkey = @"colLLModelkey";
@implementation UICollectionViewCell (LLModel)

- (void)setModel:(LLCollectCell *)model {
    objc_setAssociatedObject(self, &colLLModelkey, model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self updateCellUI];
}

- (LLCollectCell *)model {
    
    return objc_getAssociatedObject(self, &colLLModelkey);
}

- (void)updateCellUI {
    __weak typeof(self) weakSelf = self;
    /// 透传数据
    [self.model.kvcExt enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [weakSelf setValue:obj forKeyPath:key];
    }];
}

@end
