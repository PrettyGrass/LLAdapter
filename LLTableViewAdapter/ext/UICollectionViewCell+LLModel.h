//
//  UICollectionViewCell+LLModel.h
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLCollectCell.h"

@interface UICollectionViewCell (LLModel)
@property (strong, nonatomic) LLCollectCell *model;
- (void)updateCellUI;
@end
