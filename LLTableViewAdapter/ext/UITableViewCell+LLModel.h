//
//  UITableViewCell+LLModel.h
//  Adapter
//
//  Created by ylin on 16/6/12.
//  Copyright © 2016年 ylin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LLTableCell;
@interface UITableViewCell (LLModel)

@property (strong, nonatomic) LLTableCell *model;
/// 是否允许重置cell 的Frame
- (BOOL)resetCellFrame;
- (void)updateCellUI;

@end
