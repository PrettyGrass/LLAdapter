//
//  UITableViewCell+LLModel.m
//  Adapter
//
//  Created by ylin on 16/6/12.
//  Copyright © 2016年 ylin. All rights reserved.
//

#import "UITableViewCell+LLModel.h"
#import "objc/runtime.h"
#import "LLTableCell.h"
#import "Masonry.h"

static NSInteger kCellSelectTag = 1000221;
static NSInteger kCellSeparatorStyleTag = 1000222;
static NSString *celLLModelkey = @"celLLModelkey";
@implementation UITableViewCell (LLModel)

- (void)setLl_model:(LLTableCell *)ll_model {
    objc_setAssociatedObject(self, &celLLModelkey, ll_model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self ll_updateCellUI];
}

- (LLTableCell *)ll_model {
    
    return objc_getAssociatedObject(self, &celLLModelkey);
}

- (void)ll_updateCellUI {
    __weak typeof(self) weakSelf = self;
    
    if ([NSStringFromClass(self.class) isEqualToString:@"UITableViewCell"]) {
        self.textLabel.text = self.ll_model.text;
        self.detailTextLabel.text = self.ll_model.detailText;
        id img = self.ll_model.image;
        BOOL isStr = [img isKindOfClass:NSString.class];
        BOOL isImage = [img isKindOfClass:UIImage.class];
        if (isStr && ((NSString *)img).length > 0) {
            self.imageView.image = [UIImage imageNamed:img];
        } else if (isImage) {
            self.imageView.image = img;
        }
    }
    //分割线
    UIView *contentView = self.contentView;
    
    UIView *separ = [contentView viewWithTag:kCellSeparatorStyleTag];
    if (self.ll_model.separatorStyle == LLTableViewCellSeparatorStyleNone) {
        [separ setHidden:true];
    } else {
        if (!separ) {
            separ = [[UIView alloc] init];
            separ.tag = kCellSeparatorStyleTag;
            [contentView addSubview:separ];
        }
        [separ setHidden:false];
        UIColor *defaultColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1];
        UIColor *color = self.ll_model.separatorColor;
        if (!color) {
            color = defaultColor;
        }
        
        if (self.ll_model.separatorStyle == LLTableViewCellSeparatorStyleInner) {
            [separ setBackgroundColor:defaultColor];
        } else {
            [separ setBackgroundColor:color];
        }
        [separ mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(contentView).offset(weakSelf.ll_model.separatorInset.left);
            make.trailing.equalTo(contentView).offset(-weakSelf.ll_model.separatorInset.right);
            make.bottom.equalTo(contentView).offset(-weakSelf.ll_model.separatorInset.bottom);
            make.height.mas_equalTo(0.3f);
        }];
    }
    
    /// 选中背景色
    UIView *selectedBackgroundView = [[UIView alloc] init];
    selectedBackgroundView.tag = kCellSelectTag;
    self.selectedBackgroundView = selectedBackgroundView;
    self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    selectedBackgroundView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
    self.selectionStyle = self.ll_model.selectionStyle;
    /// 透传数据
    [self.ll_model.kvcExt enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [weakSelf setValue:obj forKeyPath:key];
    }];
}

- (void)didAddSubview:(UIView *)subview {
    [super didAddSubview:subview];
    if (subview.tag == kCellSelectTag &&
        self.selectedBackgroundView.superview) {
        self.selectedBackgroundView.backgroundColor = self.ll_model.selectionColor;
    }
}

@end
