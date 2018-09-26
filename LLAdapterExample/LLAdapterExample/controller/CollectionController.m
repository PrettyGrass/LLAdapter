//
//  CollectionController.m
//  LLAdapterExample
//
//  Created by ylin on 17/7/13.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "CollectionController.h"
#import <LLAdapter/LLAdapter.h>
#import "AACollectCell.h"
#import "CollectionHeaderView.h"

@interface CollectionController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) LLCollectionViewAdapter *adapter;

@end

@implementation CollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    ///初始化适配器
    LLCollectionViewAdapter *adapter = [[LLCollectionViewAdapter alloc] initWithCollection:self.collectionView];
    self.adapter = adapter;
    ///设置数据
    LLCollectSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [self.adapter buildAddNewSection];
    }
    
    {
        /// 头
        LLCollectCell <NSDictionary *>*simpleCell = [[LLCollectCell alloc] init];
        simpleCell.data = [NSDictionary dictionary];
        simpleCell.cellClick = ^(AACollectCell <NSDictionary *>*cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.cellClazz = CollectionHeaderView.class;
        simpleCell.loadType = LLCellLoadTypeOri;
        simpleCell.cellSize = CGSizeMake(100, 100);
        
        section.headerCell = simpleCell;

    }
    
    {
        /// 尾
        LLCollectCell <NSDictionary *>*simpleCell = [[LLCollectCell alloc] init];
        simpleCell.data = [NSDictionary dictionary];
        simpleCell.cellClick = ^(LLCollectCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.cellClazz = CollectionHeaderView.class;
        simpleCell.loadType = LLCellLoadTypeOri;
        simpleCell.cellSize = CGSizeMake(100, 50);
        
        section.footerCell = simpleCell;
        
    }
    
    /// cell
    for (NSInteger i = 0; i < 10; i ++) {
        LLCollectCell *simpleCell = [section buildAddCell];
        simpleCell.cellClick = ^(LLCollectCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.cellClazz = UICollectionViewCell.class;
        simpleCell.loadType = LLCellLoadTypeInner;
    }
    [self.adapter reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
