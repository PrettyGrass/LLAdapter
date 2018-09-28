//
//  SimpleCellView.h
//  LLAdapterExample
//
//  Created by ylin on 17/3/6.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLAdapterDefine.h"
#import "LLTableCell.h"

@interface SimpleCellView : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (copy, nonatomic) LLTableCellAction(cellBtnClick);
    
@end
