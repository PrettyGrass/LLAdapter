//
//  LLTableSection.h
//  Adapter
//
//  Created by ylin.yang on 2016/6/24.
//  Copyright © 2016年 ylin.yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLBaseSection.h"
#import "LLTableCell.h"

/**
 *	@author Y0, 16-07-04 17:07:59
 *
 *	tableView section 模型
 *
 *	@since 1.0
 */
@interface LLTableSection<LLCellType: LLTableCell*, LLHeaderType: LLTableCell*, LLFooterType: LLTableCell*>: LLBaseSection<LLCellType, LLHeaderType, LLFooterType>

@end
