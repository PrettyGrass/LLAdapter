//
//  SimpleCellView.m
//  LLTableViewAdapterExample
//
//  Created by ylin on 17/3/6.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "SimpleCellView.h"
#import <UITableViewCell+LLModel.h>
#import "LLTableCell.h"

@implementation SimpleCellView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)ll_updateCellUI {
    [super ll_updateCellUI];
    self.titleLab.text = self.ll_model.title;
}
@end
