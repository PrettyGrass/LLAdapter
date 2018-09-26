//
//  CustomCellView.m
//  LLAdapterExample
//
//  Created by ylin on 17/6/7.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "CustomCellView.h"
#import <UITableViewCell+LLModel.h>
#import "LLTableCell.h"

@implementation CustomCellView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)ll_updateCellUI {
    [super ll_updateCellUI];
    self.titleLab.text = self.ll_model.text;
}
- (IBAction)btnAction:(id)sender {
    
}

@end
