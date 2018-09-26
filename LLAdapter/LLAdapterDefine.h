//
//  LLAdapterDefine.h
//  Pods
//
//  Created by ylin on 17/3/8.
//
//

#ifndef LLAdapterDefine_h
#define LLAdapterDefine_h

#define LLAdapterCellAction(_ActionName_, _CellType_) void(^_ActionName_)(__kindof _CellType_ model, NSIndexPath *index)

/// TableView 事件
#define LLTableCellAction(_ActionName_) LLAdapterCellAction(_ActionName_, LLTableCell*)
#define LLTableCellActionData(_ActionName_, _DataType_) LLAdapterCellAction(_ActionName_, (LLTableCell <_DataType_>*))

/// CollectionView 事件
#define LLCollectionCellAction(_ActionName_) LLAdapterCellAction(_ActionName_, LLCollectCell*)
#define LLCollectionCellActionData(_ActionName_, _DataType_) LLAdapterCellAction(_ActionName_, (LLCollectCell <_DataType_>*))


#endif /* LLAdapterDefine_h */
