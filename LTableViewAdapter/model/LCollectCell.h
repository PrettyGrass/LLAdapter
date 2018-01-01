//
//  LCollectCell.h
//  Adapter
//
//  Created by ylin.yang on 2016/7/5.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTableCell.h"
@class LCollectCell;

typedef void (^CollClick)(LCollectCell *model, NSIndexPath *index);

/**
 *	@author Y0, 16-07-05 22:07:19
 *
 *	collection cell
 *
 *	@since 1.0
 */
@interface LCollectCell <DataType: NSObject *>: NSObject

/// kvc 透传数据
@property (strong, nonatomic) NSMutableDictionary *kvcExt;
@property (weak, nonatomic) NSIndexPath *indexPath;
@property (assign, nonatomic) CGSize cellSize;
//@property (copy, nonatomic) NSString *title;
//@property (copy, nonatomic) NSString *subTitle;
@property (copy, nonatomic) CollClick cellClick;
@property (assign, nonatomic) Class cellClazz;

/// cell Identity
@property (copy, nonatomic) NSString *cellIdentity;
/// cell NibName
@property (copy, nonatomic) NSString *cellNibName;

@property (assign, nonatomic) CellLoadType loadType;
@property (strong, nonatomic) DataType data;

@end
