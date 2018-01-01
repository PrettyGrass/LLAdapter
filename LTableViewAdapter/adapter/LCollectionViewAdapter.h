//
//  LCollectionViewAdapter.h
//  GetTV_iOS
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LBaseAdapter.h"
@class LCollectSection;
/**
 *	@author Y0, 16-07-06 16:07:50
 *
 *	CollectionView数据适配器
 *
 *	@since 1.0
 */
@interface LCollectionViewAdapter : LBaseAdapter<LCollectSection *><UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) UICollectionView *collectionView;
//@property (strong, nonatomic) NSMutableArray <LCollectSection *>* sections;
@property (weak, nonatomic) id<UICollectionViewDelegate> collectionViewDelegate;
@property (weak, nonatomic) id<UICollectionViewDataSource> dataSourceDelegate;

- (LCollectSection *)addNewSection;
- (instancetype)initWithCollection:(UICollectionView *)collectionView;

@end
