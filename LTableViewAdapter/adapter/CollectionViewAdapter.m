//
//  CollectionViewAdapter.m
//  GetTV_iOS
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "CollectionViewAdapter.h"
#import "UICollectionViewCell+Model.h"
#import "NSObject+Clazz.h"
#import "CollectSection.h"

@interface CollectionViewAdapter ()

@end

@implementation CollectionViewAdapter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sections = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setCollectionView:(UICollectionView *)collectionView {
    
    if (_collectionView == collectionView) {
        return;
    }
    _collectionView = collectionView;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
}
- (void)reloadData {
    
    [super reloadData];
    [self.collectionView reloadData];
}
#pragma - mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return self.sections.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.sections[section].datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CollectCell *cellModel = self.sections[indexPath.section].datas[indexPath.row];
    switch (cellModel.loadType) {
        case CellLoadTypeInner:
            //[collectionView registerClass:cellModel.cellClazz forCellWithReuseIdentifier:[cellModel.cellClazz className]];
            break;
        case CellLoadTypeNib:
            [collectionView registerNib:[UINib nibWithNibName:[cellModel.cellClazz className] bundle:nil] forCellWithReuseIdentifier:[cellModel.cellClazz className]];
            break;
        case CellLoadTypeOri:
            [collectionView registerClass:cellModel.cellClazz forCellWithReuseIdentifier:[cellModel.cellClazz className]];
            break;
            
        default:
            break;
    }

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[cellModel.cellClazz className] forIndexPath:indexPath];
    
    if (!cell) {
           }
    cell.model = cellModel;
    cellModel.indexPath = indexPath;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectCell *cellModel = self.sections[indexPath.section].datas[indexPath.row];
    if (cellModel.cellClick) {
        cellModel.cellClick(cellModel, indexPath);
    }
}

#pragma -mark- UIScrollViewDelegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, nil];
//}
//- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
//
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, nil];
//}
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, nil];
//}
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, velocity,targetContentOffset, nil];
//}
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    
//    
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, decelerate, nil];
//}
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
//    
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, nil];
//}
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, nil];
//}
//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//    
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, nil];
//}
//- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
//    
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return nil;
//    }
//    return [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, nil];
//}
//- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view{
//    
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, view, nil];
//}
//- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
//    
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, view, scale, nil];
//}
//- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
//    
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return false;
//    }
//    return [[(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, nil] boolValue];
//}
//- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
//    
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, scrollView, nil];
//}
//- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, collectionView, cell, indexPath, nil];
//}
//- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
//        return;
//    }
//    [(NSObject *)self.collectionViewDelegate performSelectorWithArgs:_cmd, collectionView, cell, indexPath, nil];
//}

@end
