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

static NSInteger kCellSelectTag = 1000221;
static NSString *cellmodelkey = @"cellmodelkey";
@implementation UITableViewCell (Model)

//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        // When swizzling a class method, use the following:
//        //Class class = object_getClass((id)self);
//
//        SEL originalSelector = NSSelectorFromString(@"setSelected:animated:");
//        SEL swizzledSelector = @selector(customSetSelected::animated:);
//
//        Method originalMethod = class_getClassMethod(class, originalSelector);
//        Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
//
//        BOOL didAddMethod =
//        class_addMethod(class,
//                        originalSelector,
//                        method_getImplementation(swizzledMethod),
//                        method_getTypeEncoding(swizzledMethod));
//
//        if (didAddMethod) {
//            class_replaceMethod(class,
//                                swizzledSelector,
//                                method_getImplementation(originalMethod),
//                                method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
//    });
//}

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

//- (void)setFrame:(CGRect)frame {
//    __weak typeof(self) weakSelf = self;
//    /// 设置上下左右边距
//    if ([self resetCellFrame] && [self.model isKindOfClass:[TableCell class]]) {
//        /// cell重用时要重置frame
//        if (CGRectIsEmpty(self.model.cellOriFrame)||
//            CGRectIsNull(self.model.cellOriFrame)) {
//            self.model.cellOriFrame = frame;
//        } else {
//            frame = self.model.cellOriFrame;
//        }
//        //frame.origin.y += self.model.cellSpaceMargin.top;
//        //frame.size.height -= (self.model.cellSpaceMargin.top+self.model.cellSpaceMargin.bottom);
//        //frame.origin.x += self.model.cellSpaceMargin.left;
//        //frame.size.width -= (self.model.cellSpaceMargin.left+self.model.cellSpaceMargin.right);
//        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.leading.equalTo(weakSelf).offset(weakSelf.model.cellSpaceMargin.left);
//            make.trailing.equalTo(weakSelf).offset(-weakSelf.model.cellSpaceMargin.right);
//            make.top.equalTo(weakSelf).offset(weakSelf.model.cellSpaceMargin.top);
//            make.bottom.equalTo(weakSelf).offset(-weakSelf.model.cellSpaceMargin.bottom);
//        }];
//    }
//    [super setFrame:frame];
//}
- (void)updateUI {
    __weak typeof(self) weakSelf = self;
    
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf).offset(weakSelf.model.cellSpaceMargin.left);
        make.trailing.equalTo(weakSelf).offset(-weakSelf.model.cellSpaceMargin.right);
        make.top.equalTo(weakSelf).offset(weakSelf.model.cellSpaceMargin.top);
        make.bottom.equalTo(weakSelf).offset(-weakSelf.model.cellSpaceMargin.bottom);
    }];
    
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
    //分割线
    UIView *contentView = self.contentView;
    NSInteger tag = 123154;
    if (self.model.separatorStyle == TableViewCellSeparatorStyleNone) {
        UIView *separ = [contentView viewWithTag:tag];
        [separ setHidden:true];
    } else {
        UIView *separ = [contentView viewWithTag:tag];
        if (!separ) {
            separ = [[UIView alloc] init];
            separ.tag = tag;
            [contentView addSubview:separ];
        }
        [separ setHidden:false];
        UIColor *defaultColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1];
        UIColor *color = self.model.separatorColor;
        if (!color) {
            color = defaultColor;
        }
        
        if (self.model.separatorStyle == TableViewCellSeparatorStyleInner) {
            [separ setBackgroundColor:defaultColor];
        } else {
            [separ setBackgroundColor:color];
        }
        [separ mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.leading.equalTo(contentView).offset(weakSelf.model.separatorInset.left);
            make.trailing.equalTo(contentView).offset(-weakSelf.model.separatorInset.right);
            make.bottom.equalTo(contentView).offset(-weakSelf.model.separatorInset.bottom);
            make.height.mas_equalTo(0.3f);
        }];
    }
    
    /// 选中背景色
    UIView *selectedBackgroundView = [[UIView alloc] init];
    selectedBackgroundView.tag = kCellSelectTag;
    self.selectedBackgroundView = selectedBackgroundView;
    self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    selectedBackgroundView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
    
    /// 透传数据
    [self.model.kvcExt enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [weakSelf setValue:obj forKeyPath:key];
    }];
}
//- (void)customSetSelected:(BOOL)selected animated:(BOOL)animated {
//    [self customSetSelected:selected animated:animated];
//    __weak typeof(self) weakSelf = self;
//    if (self.selectedBackgroundView.superview) {
//        [self.selectedBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.leading.equalTo(weakSelf.selectedBackgroundView.superview).offset(weakSelf.model.cellSpaceMargin.left);
//            make.trailing.equalTo(weakSelf.selectedBackgroundView.superview).offset(-weakSelf.model.cellSpaceMargin.right);
//            make.top.equalTo(weakSelf.selectedBackgroundView.superview).offset(weakSelf.model.cellSpaceMargin.top);
//            make.bottom.equalTo(weakSelf.selectedBackgroundView.superview).offset(-weakSelf.model.cellSpaceMargin.bottom);
//        }];
//        self.selectedBackgroundView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.2];
//    }
//
//}

- (void)didAddSubview:(UIView *)subview {
    [super didAddSubview:subview];
    if (subview.tag == kCellSelectTag) {
        __weak typeof(self) weakSelf = self;
        if (self.selectedBackgroundView.superview) {
            [self.selectedBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.leading.equalTo(weakSelf.selectedBackgroundView.superview).offset(weakSelf.model.cellSpaceMargin.left);
                make.trailing.equalTo(weakSelf.selectedBackgroundView.superview).offset(-weakSelf.model.cellSpaceMargin.right);
                make.top.equalTo(weakSelf.selectedBackgroundView.superview).offset(weakSelf.model.cellSpaceMargin.top);
                make.bottom.equalTo(weakSelf.selectedBackgroundView.superview).offset(-weakSelf.model.cellSpaceMargin.bottom);
            }];
            self.selectedBackgroundView.backgroundColor = weakSelf.model.selectionColor;
        }
    }
}

@end
