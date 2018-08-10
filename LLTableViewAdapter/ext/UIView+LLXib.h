//
//  UIView+Xib.h
//  Adapter
//
//  Created by ylin.yang on 2016/7/1.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LLXib)

/// 从xib加载视图，xib文件名为类名
+ (instancetype)loadViewFromXib;
/// 从xib加载视图，xib文件名: nibName
+ (instancetype)loadViewFromXibName:(NSString *)nibName;

@end
