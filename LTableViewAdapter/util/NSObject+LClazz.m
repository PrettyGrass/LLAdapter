//
//  NSObject+Clazz.m
//  Adapter
//
//  Created by ylin on 16/6/12.
//  Copyright © 2016年 ylin. All rights reserved.
//

#import "NSObject+Clazz.h"

@implementation NSObject (LClazz)

- (NSString *)className {
    return NSStringFromClass(self.class);
}

+ (NSString *)className {
    return NSStringFromClass(self);
}
@end
