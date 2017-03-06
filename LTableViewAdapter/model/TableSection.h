//
//  TableSection.h
//  GetTV_iOS
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableCell;
/**
 *	@author Y0, 16-07-04 17:07:59
 *
 *	tableView section 模型
 *
 *	@since 1.0
 */
@interface TableSection : NSObject
/// 标题
@property (copy, nonatomic) NSString *sectionTitle;
/// 单元的数据集合
@property (strong, nonatomic) NSMutableArray <TableCell *>*datas;
@end
