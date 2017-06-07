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

@implementation CustomCellView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)updateUI {
    [super updateUI];
    self.titleLab.text = self.model.title;
}

@end
