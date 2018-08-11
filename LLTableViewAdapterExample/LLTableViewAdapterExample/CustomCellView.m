//
//  CustomCellView.m
//  LLTableViewAdapterExample
//
//  Created by ylin on 17/6/7.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "CustomCellView.h"
#import <UITableViewCell+LLModel.h>
#import "LLTableCell.h"
#import <Masonry.h>

@implementation CustomCellView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)ll_updateCellUI {
    __weak typeof(self) weakSelf = self;
    [super ll_updateCellUI];
    self.titleLab.text = self.ll_model.title;
}
- (IBAction)btnAction:(id)sender {
    
}

@end
