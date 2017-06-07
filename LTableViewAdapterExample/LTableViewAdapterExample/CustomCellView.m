//
//  CustomCellView.m
//  LTableViewAdapterExample
//
//  Created by ylin on 17/6/7.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "CustomCellView.h"
#import <UITableViewCell+Model.h>
#import "TableCell.h"
#import <Masonry.h>

@implementation CustomCellView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)updateUI {
    __weak typeof(self) weakSelf = self;
    [super updateUI];
    self.titleLab.text = self.model.title;
}

@end
