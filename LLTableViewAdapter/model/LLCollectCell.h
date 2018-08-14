//
//  LLCollectCell.h
//  Adapter
//
//  Created by ylin.yang on 2016/7/5.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLBaseCell.h"
@class LLCollectCell;

typedef void (^LLCollAction)(LLCollectCell *model, NSIndexPath *index);

/**
 *	@author Y0, 16-07-05 22:07:19
 *
 *	collection cell
 *
 *	@since 1.0
 */
@interface LLCollectCell <DataType>: LLBaseCell<DataType>

@property (assign, nonatomic) CGSize cellSize;
/// 点击事件 DataType 为cell的 data 类型
@property (copy, nonatomic) void (^cellClick)(LLCollectCell <DataType>*model, NSIndexPath *index);

@end
