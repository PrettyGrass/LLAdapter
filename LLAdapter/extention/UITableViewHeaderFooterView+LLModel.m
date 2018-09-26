//
//  UITableViewHeaderFooterView+LLModel.m
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "UITableViewHeaderFooterView+LLModel.h"
#import <objc/runtime.h>

static NSString *colLLModelkey = @"UITableViewHeaderFooterView+Modelkey";
@implementation UITableViewHeaderFooterView (LLModel)

- (void)setLl_model:(LLTableCell *)ll_model {
    objc_setAssociatedObject(self, &colLLModelkey, ll_model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self ll_updateCellUI];
}

- (LLTableCell *)ll_model {
    
    return objc_getAssociatedObject(self, &colLLModelkey);
}

- (void)ll_updateCellUI {
    __weak typeof(self) weakSelf = self;
    // 如果是原生的cell 处理数据
    if ([NSStringFromClass(self.class) isEqualToString:@"UITableViewHeaderFooterView"]) {
        if (self.ll_model.text) {
            self.textLabel.text = self.ll_model.text;
        }
        if (self.ll_model.detailText) {
            self.detailTextLabel.text = self.ll_model.detailText;
        }
    }
    /// 透传数据
    [self.ll_model.kvcExt enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [weakSelf setValue:obj forKeyPath:key];
    }];
}

@end
