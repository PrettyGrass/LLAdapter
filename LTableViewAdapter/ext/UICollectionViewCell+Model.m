//
//  UICollectionViewCell+Model.m
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "UICollectionViewCell+Model.h"
#import <objc/runtime.h>

static NSString *collmodelkey = @"collmodelkey";
@implementation UICollectionViewCell (Model)

- (void)setModel:(CollectCell *)model {
    objc_setAssociatedObject(self, &collmodelkey, model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self updateUI];
}

- (CollectCell *)model {
    
    return objc_getAssociatedObject(self, &collmodelkey);
}

- (void)updateUI {

}

@end
