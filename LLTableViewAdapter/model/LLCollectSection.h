//
//  LLCollectSection.h
//  Adapter
//
//  Created by ylin.yang on 2016/7/5.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LLCollectCell;

/**
 *	@author Y0, 16-07-05 22:07:39
 *
 *  宫格视图单元模型
 *
 *	@since 1.0
 */
@interface LLCollectSection : NSObject
/// 单元标题
@property (copy, nonatomic) NSString *sectionTitle;
/// 单元数据集合
@property (strong, nonatomic) NSMutableArray <LLCollectCell *>*datas;
/// section 索引
@property (assign, nonatomic) NSInteger sectionIndex;

- (void)addCell:(LLCollectCell *)cell;
- (__kindof LLCollectCell *)addNewCell;
- (__kindof LLCollectCell *)addNewCell:(Class)clzz;

@end
