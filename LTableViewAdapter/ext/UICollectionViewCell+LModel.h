//
//  UICollectionViewCell+LModel.h
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCollectCell.h"

@interface UICollectionViewCell (LModel)
@property (strong, nonatomic) LCollectCell *model;
- (void)updateCellUI;
@end
