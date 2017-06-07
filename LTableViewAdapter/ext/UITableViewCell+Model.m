//
//  UITableViewCell+Model.m
//  GetTV_iOS
//
//  Created by ylin on 16/6/12.
//  Copyright © 2016年 ylin. All rights reserved.
//

#import "UITableViewCell+Model.h"
#import "objc/runtime.h"
#import "TableCell.h"
#import "Masonry.h"

static NSString *cellmodelkey = @"cellmodelkey";
@implementation UITableViewCell (Model)

- (void)setModel:(TableCell *)model {
    objc_setAssociatedObject(self, &cellmodelkey, model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    model.cellOriFrame = CGRectZero;
    [self updateUI];
}

- (TableCell *)model {
    
    return objc_getAssociatedObject(self, &cellmodelkey);
}

- (BOOL)resetCellFrame {
    return true;
}

- (void)setFrame:(CGRect)frame {
    
    /// 设置上下左右边距
    if ([self resetCellFrame] && [self.model isKindOfClass:[TableCell class]]) {
        /// cell重用时要重置frame
        if (CGRectIsEmpty(self.model.cellOriFrame)||
            CGRectIsNull(self.model.cellOriFrame)) {
            self.model.cellOriFrame = frame;
        } else {
            frame = self.model.cellOriFrame;
        }
        frame.origin.y += self.model.cellSpaceMargin.top;
        frame.size.height -= (self.model.cellSpaceMargin.top+self.model.cellSpaceMargin.bottom);
        frame.origin.x += self.model.cellSpaceMargin.left;
        frame.size.width -= (self.model.cellSpaceMargin.left+self.model.cellSpaceMargin.right);
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(self.model.cellSpaceMargin.left);
            make.trailing.equalTo(self).offset(self.model.cellSpaceMargin.right);
            make.top.equalTo(self).offset(self.model.cellSpaceMargin.top);
            make.bottom.equalTo(self).offset(self.model.cellSpaceMargin.bottom);
        }];
    }
    [super setFrame:frame];
}
- (void)updateUI {
    
    if ([NSStringFromClass(self.class) isEqualToString:@"UITableViewCell"]) {
        self.textLabel.text = self.model.title;
        self.detailTextLabel.text = self.model.subTitle;
        NSString *img = self.model.image;
        if ([img hasPrefix:@"http://"]||[img hasPrefix:@"https://"]) {
            //[self.imageView setImageURL:[NSURL URLWithString:img]];
        } else if (img.length > 0) {
            self.imageView.image = [UIImage imageNamed:img];
        }
    }
    
    __weak typeof(self) weakSelf = self;
    [self.model.kvcExt enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [weakSelf setValue:obj forKeyPath:key];
    }];
    if (self.model.separatorStyle != TableViewCellSeparatorStyleNone) {
        NSInteger tag = 123154;
        UIView *separ = [self.contentView viewWithTag:tag];
        if (!separ) {
            separ = [[UIView alloc] init];
            separ.tag = tag;
            [self.contentView addSubview:separ];
        }
        UIColor *defaultColor = [UIColor redColor];//[UIColor colorWithHue:229/255.0 saturation:229/255.0 brightness:229/255.0 alpha:1];
        UIColor *color = self.model.separatorColor;
        if (!color) {
            color = defaultColor;
        }
        
        if (self.model.separatorStyle == TableViewCellSeparatorStyleInner) {
            [separ setBackgroundColor:defaultColor];
            [separ mas_remakeConstraints:^(MASConstraintMaker *make) {
            
                make.leading.equalTo(weakSelf.textLabel);
                make.trailing.equalTo(weakSelf);
                make.bottom.equalTo(weakSelf);
                make.height.mas_equalTo(0.3f);
            }];
        } else {
            [separ setBackgroundColor:color];
            [separ mas_remakeConstraints:^(MASConstraintMaker *make) {
            
                make.leading.equalTo(weakSelf.contentView).offset(weakSelf.model.separatorInset.left);
                make.trailing.equalTo(weakSelf.contentView).offset(-weakSelf.model.separatorInset.right);
                make.bottom.equalTo(weakSelf.contentView).offset(-weakSelf.model.separatorInset.bottom);
                make.height.mas_equalTo(0.3f);
            }];
        }

    }
//    ___weakSelf
//    [self.model.kvcExt enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        [weakSelf setValue:obj forKeyPath:key];
//    }];
}

@end
