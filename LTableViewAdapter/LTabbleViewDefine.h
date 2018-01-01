//
//  LTabbleViewDefine.h
//  Pods
//
//  Created by ylin on 17/3/8.
//
//

#ifndef LTabbleViewDefine_h
#define LTabbleViewDefine_h

/// cell事件定义block
#define LTableCellActionDefine(_name_, _type_) void(^_name_)(__kindof LTableCell <_type_>*model, NSIndexPath *index);

#define LCollectCellActionDefine(_name_, _type_) void(^_name_)(__kindof LCollectCell <_type_>*model, NSIndexPath *index);

#endif /* LTabbleViewDefine_h */
