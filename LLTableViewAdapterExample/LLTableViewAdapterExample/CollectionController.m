//
//  CollectionController.m
//  LLTableViewAdapterExample
//
//  Created by ylin on 17/7/13.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "CollectionController.h"
#import <LLTableViewAdapter/LLAdapter.h>

@interface CollectionController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) LLCollectionViewAdapter *adapter;

@end

@implementation CollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    //self.view.backgroundColor = [UIColor lightGrayColor];
    //self.simpleTable.backgroundColor = [UIColor clearColor];
    ///初始化适配器
    LLCollectionViewAdapter *adapter = [[LLCollectionViewAdapter alloc] initWithCollection:self.collectionView];
    self.adapter = adapter;

    
    ///设置数据
    
    LLCollectSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [self.adapter addNewSection];
    }
    {
        LLCollectCell *simpleCell = [section addNewCell];
        simpleCell.cellClick = ^(LLCollectCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.cellClazz = UICollectionViewCell.class;
        simpleCell.loadType = CellLoadTypeInner;
    }
    {
        LLCollectCell *simpleCell = [section addNewCell];
        simpleCell.cellClick = ^(LLCollectCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.cellClazz = UICollectionViewCell.class;
        simpleCell.loadType = CellLoadTypeInner;
    }
    {
        LLCollectCell *simpleCell = [section addNewCell];
        simpleCell.cellClick = ^(LLCollectCell *cell, NSIndexPath *indexPath) {
            
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
