//
//  LLCollectionViewAdapter.m
//  Adapter
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LLCollectionViewAdapter.h"
#import "UICollectionViewCell+LLModel.h"
#import "NSObject+LLClazz.h"
#import "LLCollectSection.h"

@interface LLCollectionViewAdapter ()

@end

@implementation LLCollectionViewAdapter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sections = [[NSMutableArray alloc] init];
    }
    return self;
}


- (instancetype)initWithCollection:(UICollectionView *)collectionView {
    
    self = [self init];
    if (self) {
        self.collectionView = collectionView;
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

- (LLCollectSection *)addNewSection {
    
    if (!self.sections) {
        self.sections = [NSMutableArray array];
    }
    LLCollectSection *section = [[LLCollectSection alloc] init];
    [self.sections addObject:section];
    return section;
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
    
    LLCollectCell *celLLModel = self.sections[indexPath.section].datas[indexPath.row];
    celLLModel.indexPath = indexPath;
    switch (celLLModel.loadType) {
        case CellLoadTypeInner:
            //[collectionView registerClass:celLLModel.cellClazz forCellWithReuseIdentifier:[celLLModel.cellClazz className]];
            break;
        case CellLoadTypeNib:
            [collectionView registerNib:[UINib nibWithNibName:[celLLModel cellNibName] bundle:nil] forCellWithReuseIdentifier:[celLLModel cellIdentity]];
            break;
        case CellLoadTypeOri:
            [collectionView registerClass:celLLModel.cellClazz forCellWithReuseIdentifier:[celLLModel cellIdentity]];
            break;
            
        default:
            break;
    }

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[celLLModel cellIdentity] forIndexPath:indexPath];
    
    if (!cell) {
           }
    cell.model = celLLModel;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LLCollectCell *celLLModel = self.sections[indexPath.section].datas[indexPath.row];
    if (celLLModel.cellClick) {
        celLLModel.cellClick(celLLModel, indexPath);
    }
}

#pragma -mark- UIScrollViewDelegate
#pragma - mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.collectionViewDelegate scrollViewDidScroll:scrollView];
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.collectionViewDelegate scrollViewDidZoom:scrollView];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.collectionViewDelegate scrollViewWillBeginDragging:scrollView];
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.collectionViewDelegate scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.collectionViewDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.collectionViewDelegate scrollViewWillBeginDecelerating:scrollView];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.collectionViewDelegate scrollViewDidEndDecelerating:scrollView];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.collectionViewDelegate scrollViewDidEndScrollingAnimation:scrollView];
}
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return nil;
    }
    return [self.collectionViewDelegate viewForZoomingInScrollView:scrollView];
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view{
    
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.collectionViewDelegate scrollViewWillBeginZooming:scrollView withView:view];
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.collectionViewDelegate scrollViewDidEndZooming:scrollView withView:view atScale:scale];
}
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return false;
    }
    return [self.collectionViewDelegate scrollViewShouldScrollToTop:scrollView];
}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    
    if (![self.collectionViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.collectionViewDelegate scrollViewDidScrollToTop:scrollView];
}

@end
