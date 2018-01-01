//
//  CollectionController.m
//  LTableViewAdapterExample
//
//  Created by ylin on 17/7/13.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "CollectionController.h"
#import <LTableViewAdapter/LAdapter.h>

@interface CollectionController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) LCollectionViewAdapter *adapter;

@end

@implementation CollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    //self.view.backgroundColor = [UIColor lightGrayColor];
    //self.simpleTable.backgroundColor = [UIColor clearColor];
    ///初始化适配器
    LCollectionViewAdapter *adapter = [[LCollectionViewAdapter alloc] initWithCollection:self.collectionView];
    self.adapter = adapter;

    
    ///设置数据
    
    LCollectSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [self.adapter addNewSection];
    }
    {
        LCollectCell *simpleCell = [section addNewCell];
        simpleCell.cellClick = ^(LCollectCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.cellClazz = UICollectionViewCell.class;
        simpleCell.loadType = CellLoadTypeInner;
    }
    {
        LCollectCell *simpleCell = [section addNewCell];
        simpleCell.cellClick = ^(LCollectCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.cellClazz = UICollectionViewCell.class;
        simpleCell.loadType = CellLoadTypeInner;
    }
    {
        LCollectCell *simpleCell = [section addNewCell];
        simpleCell.cellClick = ^(LCollectCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.cellClazz = UICollectionViewCell.class;
        simpleCell.loadType = CellLoadTypeInner;
    }
    [self.adapter reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
