//
//  CollectCell.h
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/7/5.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableCell.h"
@class CollectCell;

typedef void (^CollClick)(CollectCell *model, NSIndexPath *index);

/**
 *	@author Y0, 16-07-05 22:07:19
 *
 *	collection cell
 *
 *	@since 1.0
 */
@interface CollectCell <DataType: NSObject *>: NSObject

@property (weak, nonatomic) NSIndexPath *indexPath;
@property (assign, nonatomic) CGSize cellSize;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subTitle;
@property (copy, nonatomic) CollClick cellClick;
@property (assign, nonatomic) Class cellClazz;
@property (assign, nonatomic) CellLoadType loadType;
@property (strong, nonatomic) DataType data;

@end
