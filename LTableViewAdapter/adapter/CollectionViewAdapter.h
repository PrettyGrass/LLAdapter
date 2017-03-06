//
//  CollectionViewAdapter.h
//  GetTV_iOS
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "BaseAdapter.h"
@class CollectSection;
/**
 *	@author Y0, 16-07-06 16:07:50
 *
 *	CollectionView数据适配器
 *
 *	@since 1.0
 */
@interface CollectionViewAdapter : BaseAdapter<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray <CollectSection *>* sections;
@property (weak, nonatomic) id<UICollectionViewDelegate> collectionViewDelegate;
@property (weak, nonatomic) id<UICollectionViewDataSource> dataSourceDelegate;

@end
