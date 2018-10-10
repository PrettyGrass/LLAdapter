//
//  UITableViewHeaderFooterView+LLModel.h
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTableSectionReusableCell.h"

@interface UITableViewHeaderFooterView (LLModel)
@property (strong, nonatomic) LLTableSectionReusableCell *ll_model;
- (void)ll_updateCellUI NS_REQUIRES_SUPER;
@end
