//
//  CollectionController.m
//  LTableViewAdapterExample
//
//  Created by ylin on 17/7/13.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "CollectionController.h"
#import <LTableViewAdapter/LTableViewAdapter.h>

@interface CollectionController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) CollectionViewAdapter *adapter;

@end

@implementation CollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    //self.view.backgroundColor = [UIColor lightGrayColor];
    //self.simpleTable.backgroundColor = [UIColor clearColor];
    ///初始化适配器
    CollectionViewAdapter *adapter = [[CollectionViewAdapter alloc] initWithCollection:self.collectionView];
    self.adapter = adapter;

    
    ///设置数据
    
    CollectSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [self.adapter addNewSection];
    }
    {
        CollectCell *simpleCell = [section addNewCell];
        simpleCell.cellClick = ^(CollectCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.cellClazz = UICollectionViewCell.class;
        simpleCell.loadType = CellLoadTypeInner;
    }
    {
        CollectCell *simpleCell = [section addNewCell];
        simpleCell.cellClick = ^(CollectCell *cell, NSIndexPath *indexPath) {
            
        };
        simpleCell.cellClazz = UICollectionViewCell.class;
        simpleCell.loadType = CellLoadTypeInner;
    }
    {
        CollectCell *simpleCell = [section addNewCell];
        simpleCell.cellClick = ^(CollectCell *cell, NSIndexPath *indexPath) {
            
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
