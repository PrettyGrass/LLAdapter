//
//  LLCollectionViewAdapter.h
//  Adapter
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LLBaseAdapter.h"
#import "LLCollectSection.h"

/**
 *	@author Y0, 16-07-06 16:07:50
 *
 *	CollectionView数据适配器
 *
 *	@since 1.0
 */
@interface LLCollectionViewAdapter : LLBaseAdapter<LLCollectSection *><UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) UICollectionView *collectionView;
@property (weak, nonatomic) id<UICollectionViewDelegate> collectionViewDelegate;
@property (weak, nonatomic) id<UICollectionViewDataSource> dataSourceDelegate;

- (LLCollectSection *)buildAddNewSection;
- (instancetype)initWithCollection:(UICollectionView *)collectionView;

@end
