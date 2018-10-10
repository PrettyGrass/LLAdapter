//
//  LLTableViewAdapter.m
//  Adapter
//
//  Created by yangyl on 16/7/6.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import "LLTableViewAdapter.h"
#import "UITableViewCell+LLModel.h"
#import "UITableViewHeaderFooterView+LLModel.h"
#import "NSObject+LLClazz.h"
#import "LLTableSection.h"
#import "LLTableCell.h"
#import "UIView+LLXib.h"

@interface LLTableViewAdapter()

@end

@implementation LLTableViewAdapter

- (instancetype)initWithTableView:(UITableView *)tableView {
    
    self = [self init];
    if (self) {
        self.tableView = tableView;
    }
    return self;
}

- (void)setTableView:(UITableView *)tableView {
    
    if (_tableView == tableView) {
        return;
    }
    _tableView = tableView;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.separatorColor = [UIColor clearColor];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)reloadData {
    
    [super reloadData];
    [self.tableView reloadData];
}

- (LLTableSection *)buildAddNewSection {
    
    return [self buildAddNewSection:LLTableSection.class];
}

//- (LLTableSection *)buildAddNewSection:(Class)clazz {
//
//    LLTableSection *section = [[clazz alloc] init];
//    [self addSection:section];
//    return section;
//}
//
//- (void)addSection:(__kindof LLTableSection *)section {
//    if (!section) {
//        return;
//    }
//    [self.sections addObject:section];
//}

#pragma - mark - UITableViewDataSource
- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sections.count;
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.sections[section].datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self getCell:tableView cellForRowAtIndexPath:indexPath dequeue:true];
}

- (UITableViewCell *)getCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath dequeue:(BOOL)dequeue {
    
    LLTableCell *cellModel = self.sections[indexPath.section].datas[indexPath.row];
    cellModel.indexPath = indexPath;
    UITableViewCell *cell;
    /// 是否重用
    if (dequeue) {
        cell = [tableView dequeueReusableCellWithIdentifier:[cellModel.cellClazz ll_className]];
        if (!cell) {
            switch (cellModel.loadType) {
                case LLCellLoadTypeInner:
                    [tableView registerClass:cellModel.cellClazz forCellReuseIdentifier:cellModel.cellIdentity];
                    break;
                case LLCellLoadTypeNib:
                    [tableView registerNib:[UINib nibWithNibName:cellModel.cellNibName bundle:nil] forCellReuseIdentifier:cellModel.cellIdentity];
                    break;
                case LLCellLoadTypeOri:
                    [tableView registerClass:cellModel.cellClazz forCellReuseIdentifier:cellModel.cellIdentity];
                    break;
                    
                default:
                    break;
            }
            cell = [tableView dequeueReusableCellWithIdentifier:cellModel.cellIdentity];
        }
    } else {
        switch (cellModel.loadType) {
            case LLCellLoadTypeInner:
                cell = [[cellModel.cellClazz alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellModel.cellIdentity];
                break;
            case LLCellLoadTypeNib:{
                cell = [cellModel.cellClazz ll_loadViewFromXibName:cellModel.cellNibName];
            }
                break;
            case LLCellLoadTypeOri:
                cell = [[cellModel.cellClazz alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellModel.cellIdentity];
                break;
                
            default:
                break;
        }
    }
    cell.accessoryType = cellModel.accessoryType;
    cell.ll_model = cellModel;
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([self.dataSourceDelegate respondsToSelector:_cmd]) {
        return [self.dataSourceDelegate tableView:tableView titleForFooterInSection:section];
    }
    LLTableSection *tableSection = self.sections[section];
    return tableSection.sectionHeaderTitle;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if ([self.dataSourceDelegate respondsToSelector:_cmd]) {
        return [self.dataSourceDelegate tableView:tableView titleForFooterInSection:section];
    }
    LLTableSection *tableSection = self.sections[section];
    return tableSection.sectionFooterTitle;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if ([self.dataSourceDelegate respondsToSelector:_cmd]) {
        return [self.dataSourceDelegate sectionIndexTitlesForTableView:tableView];
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if ([self.dataSourceDelegate respondsToSelector:_cmd]) {
        return [self.dataSourceDelegate tableView:tableView sectionForSectionIndexTitle:title atIndex:index];
    }
    return 0;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (![self.dataSourceDelegate respondsToSelector:_cmd]) {
        return NO;
    }
    return [self.dataSourceDelegate tableView:tableView canEditRowAtIndexPath:indexPath];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (![self.dataSourceDelegate respondsToSelector:_cmd]) {
        return NO;
    }
    return [self.dataSourceDelegate tableView:tableView canMoveRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (![self.dataSourceDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.dataSourceDelegate tableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if (![self.dataSourceDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.dataSourceDelegate tableView:tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LLTableCell *cellModel = self.sections[indexPath.section].datas[indexPath.row];
    cellModel.indexPath = indexPath;
    if (cellModel.deSelectionStyle == LLDeSelectionStyleNow) {
        [tableView deselectRowAtIndexPath:indexPath animated:true];
    }
    if (cellModel.cellClick) {
        cellModel.cellClick(cellModel, indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.tableViewDelegate respondsToSelector:_cmd]) {
        CGFloat height = [self.tableViewDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
        if (UITableViewAutomaticDimension != height) {
            return height;
        }
    }
    LLTableCell *cellModel = self.sections[indexPath.section].datas[indexPath.row];
    cellModel.indexPath = indexPath;
    return cellModel.cellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if ([self.tableViewDelegate respondsToSelector:_cmd]) {
        return [self.tableViewDelegate tableView:tableView viewForHeaderInSection:section];
    }
    
    LLTableSection *tableSection = self.sections[section];
    LLTableSectionReusableCell *cellModel = tableSection.headerCell;
    NSAssert((!cellModel || [cellModel isKindOfClass:LLTableSectionReusableCell.class]), @"section 头必须继承自 LLTableSectionReusableCell");
    UIView *headerView = [self _tableView:tableView viewForHeaderInSection:section cellModel:cellModel];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([self.tableViewDelegate respondsToSelector:_cmd]) {
        return [self.tableViewDelegate tableView:tableView heightForHeaderInSection:section];
    }
    LLTableSection *tableSection = self.sections[section];
    LLTableSectionReusableCell *cellModel = tableSection.headerCell;
    if (cellModel) {
        NSAssert((!cellModel || [cellModel isKindOfClass:LLTableSectionReusableCell.class]), @"section 头必须继承自 LLTableSectionReusableCell");
        return cellModel.cellHeight;
    }else { //兼容系统的title
        return tableSection.sectionFooterTitleHeight;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if ([self.tableViewDelegate respondsToSelector:_cmd]) {
        return [self.tableViewDelegate tableView:tableView viewForFooterInSection:section];
    }
    
    LLTableSection *tableSection = self.sections[section];
    LLTableSectionReusableCell *cellModel = tableSection.footerCell;
    NSAssert((!cellModel || [cellModel isKindOfClass:LLTableSectionReusableCell.class]), @"section尾必须继承自 LLTableSectionReusableCell");
    UIView *headerView = [self _tableView:tableView viewForHeaderInSection:section cellModel:cellModel];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if ([self.tableViewDelegate respondsToSelector:_cmd]) {
        return [self.tableViewDelegate tableView:tableView heightForFooterInSection:section];
    }
    LLTableSection *tableSection = self.sections[section];
    LLTableSectionReusableCell *cellModel = tableSection.footerCell;
    if (cellModel) {
        NSAssert((!cellModel || [cellModel isKindOfClass:LLTableSectionReusableCell.class]), @"section 尾必须继承自 LLTableSectionReusableCell");
        return cellModel.cellHeight;
    }else {
        return tableSection.sectionFooterTitleHeight;
    }
}

- (UIView *)_tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section cellModel:(LLTableSectionReusableCell *)cellModel {
    
    if (!cellModel) {
        return nil;
    }
    NSString *cellIdentity = cellModel.cellIdentity;
    //NSAssert(([cellModel.cellClazz isKindOfClass:UITableViewHeaderFooterView.class]), @"section 头视图必须继承自 UITableViewHeaderFooterView");
    switch (cellModel.loadType) {
        case LLCellLoadTypeInner:
            //[collectionView registerClass:celModel.cellClazz forCellWithReuseIdentifier:[celModel.cellClazz ll_className]];
            break;
        case LLCellLoadTypeNib:
            [tableView registerNib:[UINib nibWithNibName:[cellModel cellNibName] bundle:nil] forHeaderFooterViewReuseIdentifier:cellIdentity];
            break;
        case LLCellLoadTypeOri:
            [tableView registerClass:cellModel.cellClazz forHeaderFooterViewReuseIdentifier:cellIdentity];
            break;
            
        default:
            break;
    }
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentity];
    headerView.ll_model = cellModel;
    return headerView;
}

#pragma - mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.tableViewDelegate scrollViewDidScroll:scrollView];
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.tableViewDelegate scrollViewDidZoom:scrollView];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.tableViewDelegate scrollViewWillBeginDragging:scrollView];
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.tableViewDelegate scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.tableViewDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.tableViewDelegate scrollViewWillBeginDecelerating:scrollView];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.tableViewDelegate scrollViewDidEndDecelerating:scrollView];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.tableViewDelegate scrollViewDidEndScrollingAnimation:scrollView];
}
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return nil;
    }
    return [self.tableViewDelegate viewForZoomingInScrollView:scrollView];
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view{
    
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.tableViewDelegate scrollViewWillBeginZooming:scrollView withView:view];
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.tableViewDelegate scrollViewDidEndZooming:scrollView withView:view atScale:scale];
}
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return false;
    }
    return [self.tableViewDelegate scrollViewShouldScrollToTop:scrollView];
}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    
    if (![self.tableViewDelegate respondsToSelector:_cmd]) {
        return;
    }
    [self.tableViewDelegate scrollViewDidScrollToTop:scrollView];
}

@end

