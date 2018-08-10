//
//  LLTabbleViewDefine.h
//  Pods
//
//  Created by ylin on 17/3/8.
//
//

#ifndef LLTabbleViewDefine_h
#define LLTabbleViewDefine_h

/// cell事件定义block
#define LLTableCellActionDefine(_name_, _type_) void(^_name_)(__kindof LLTableCell <_type_>*model, NSIndexPath *index);

#define LLCollectCellActionDefine(_name_, _type_) void(^_name_)(__kindof LLCollectCell <_type_>*model, NSIndexPath *index);

#endif /* LLTabbleViewDefine_h */
