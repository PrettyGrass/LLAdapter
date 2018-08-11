//
//  LLBaseCell.m
//  LLTableViewAdapter
//
//  Created by ylin.yang on 2018/8/11.
//

#import "LLBaseCell.h"

@implementation LLBaseCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        _kvcExt = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSString *)cellIdentity {
    
    if (_cellIdentity) {
        return _cellIdentity;
    }
    NSString *val = NSStringFromClass(self.cellClazz);
    
    return val;
}

- (NSString *)cellNibName {
    
    if (_cellNibName) {
        return _cellNibName;
    }
    NSString *val = NSStringFromClass(self.cellClazz);
    
    return val;
}


@end
