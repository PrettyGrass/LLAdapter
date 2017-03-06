//
//  UICollectionViewCell+Model.h
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectCell.h"

@interface UICollectionViewCell (Model)
@property (strong, nonatomic) CollectCell *model;
- (void)updateUI;
@end
