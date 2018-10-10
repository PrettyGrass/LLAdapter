//
//  LLTableSectionReusableCell.h
//  LLAdapter
//
//  Created by renxun on 2018/10/9.
//

#import <UIKit/UIKit.h>
#import "LLBaseCell.h"

@interface LLTableSectionReusableCell : LLBaseCell

@property (assign, nonatomic) CGFloat cellHeight; ///< 高度

@property (copy, nonatomic) NSString *text; ///< 内容描述

@property (copy, nonatomic) NSString *detailText; ///< 值在group模式下有效

@property (nonatomic, strong) UIView *backgroundView; ///< UITableViewHeaderFooterView.backgroundView

@end
