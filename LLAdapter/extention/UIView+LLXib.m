//
//  UIView+Xib.m
//  Adapter
//
//  Created by ylin.yang on 2016/7/1.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "UIView+LLXib.h"
#import "NSObject+LLClazz.h"

@implementation UIView (LLXib)

+ (instancetype)ll_loadViewFromXibName:(NSString *)nibName bundle:(NSBundle *)bundle owner:(nullable id)ownerOrNil options:(NSDictionary *)optionsOrNil {
    
    UINib *nib = [UINib nibWithNibName:nibName bundle:bundle];
    NSArray *array = [nib instantiateWithOwner:ownerOrNil options:optionsOrNil];
    id ret = nil;
    for (id tmpView in array) {
        if ([tmpView isKindOfClass:self]) {
            ret = tmpView;
            break;
        }
    }
    return ret;
}

+ (instancetype)ll_loadViewFromXibName:(NSString *)nibName bundle:(NSBundle *)bundle owner:(nullable id)ownerOrNil {
    
    return [self ll_loadViewFromXibName:nibName bundle:bundle owner:ownerOrNil options:nil];
}

+ (instancetype)ll_loadViewFromXibName:(NSString *)nibName bundle:(NSBundle *)bundle{
    
    return [self ll_loadViewFromXibName:nibName bundle:bundle owner:self];
}

+ (instancetype)ll_loadViewFromXibName:(NSString *)nibName {
    return [self ll_loadViewFromXibName:nibName bundle:[NSBundle mainBundle]];
}

+ (instancetype)ll_loadViewFromXib {
    
    return [self ll_loadViewFromXibName:[self ll_className]];
}

@end
