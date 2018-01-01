//
//  LCollectSection.h
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/7/5.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LCollectCell;

/**
 *	@author Y0, 16-07-05 22:07:39
 *
 *  宫格视图单元模型
 *
 *	@since 1.0
 */
@interface LCollectSection : NSObject
/// 单元标题
@property (copy, nonatomic) NSString *sectionTitle;
/// 单元数据集合
@property (strong, nonatomic) NSMutableArray <LCollectCell *>*datas;

- (LCollectCell *)addNewCell;

- (__kindof LCollectCell *)addNewCell:(Class)clzz;

@end
