//
//  KVLLTableCell.h
//  LLAdapterExample
//
//  Created by ylin.yang on 2017/3/8.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import <LLAdapter/LLAdapter.h>

@interface KVLLTableCell<T>: LLTableCell<T>

@property (copy, nonatomic) NSString *placeholder;
@property (copy, nonatomic) NSString *oldValue;
@property (copy, nonatomic) NSString *neWValue;

//@property ()

@end
