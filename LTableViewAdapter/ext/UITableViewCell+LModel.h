//
//  UITableViewCell+LModel.h
//  GetTV_iOS
//
//  Created by ylin on 16/6/12.
//  Copyright © 2016年 ylin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LTableCell;
@interface UITableViewCell (LModel)

@property (strong, nonatomic) LTableCell *model;
/// 是否允许重置cell 的Frame
- (BOOL)resetCellFrame;
- (void)updateCellUI;

@end
