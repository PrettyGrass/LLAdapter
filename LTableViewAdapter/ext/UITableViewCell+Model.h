//
//  UITableViewCell+Model.h
//  GetTV_iOS
//
//  Created by ylin on 16/6/12.
//  Copyright © 2016年 ylin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TableCell;
@interface UITableViewCell (Model)

@property (strong, nonatomic) TableCell *model;
/// 是否允许重置cell 的Frame
- (BOOL)resetCellFrame;
- (void)updateUI;

@end
