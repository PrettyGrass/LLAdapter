//
//  SimpleTableViewController.m
//  LLAdapterExample
//
//  Created by ylin on 17/3/8.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "SimpleTableViewController.h"
#import <LLAdapter/LLAdapter.h>

@interface SimpleTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) LLTableViewAdapter *adapter;

@end

@implementation SimpleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.simpleTable.backgroundColor = [UIColor clearColor];
    
    ///初始化适配器
    LLTableViewAdapter *adapter = [[LLTableViewAdapter alloc] initWithTableView:self.simpleTable];
    self.adapter = adapter;
    
    self.simpleTable.estimatedRowHeight = 44;
    self.simpleTable.rowHeight = UITableViewAutomaticDimension;
    ///设置数据
    [self setData:@[
                    @"有一段青春，留作永恒。剪一段时光，放在最美的段落。好好保存留作永远，时间过去岁月的路过。只是多了一道曾经，流年一路改变了我们的模样。送走了我们的青春，留给了我们曾经。这样的夜别样的心情，倒影的年华。深夜想用文字表达我内心的段落，可是终究写不出整个心情。背着这些流年在岁月里流浪，终究没有安静的场所。来安放我这沉淀的一切，似乎不能放也不能放。因为只有装进心里，才最为合适。也没有地方比装进心里，更安全。就这样让这段流年，从此埋在。",
                    @"有一段青春，留作永恒。剪一段时光，放在最美的段落。好好保存留作永远，时间过去岁月的路过。只是多了一道曾经，流年一路改变了我们的模样。送走了我们的青春，留给了我们曾经。这样的夜别样的心情，倒影的年华。深夜想用文字表达我内心的段落，可是终究写不出整个心情。背着这些流年在岁月里流浪，终究没有安静的场所。来安放我这沉淀的一切，似乎不能放也不能放。因为只有装进心里，才最为合适。也没有地方比装进心里，更安全。就这样让这段流年，从此埋在。",
                    @"有一段青春，留作永恒。剪一段时光，放在最美的段落。好好保存留作永远，时间过去岁月的路过。只是多了一道曾经，流年一路改变了我们的模样。送走了我们的青春，留给了我们曾经。这样的夜别样的心情，倒影的年华。深夜想用文字表达我内心的段落，可是终究写不出整个心情。背着这些流年在岁月里流浪，终究没有安静的场所。来安放我这沉淀的一切，似乎不能放也不能放。因为只有装进心里，才最为合适。也没有地方比装进心里，更安全。就这样让这段流年，从此埋在。有一段青春，留作永恒。剪一段时光，放在最美的段落。好好保存留作永远，时间过去岁月的路过。只是多了一道曾经，流年一路改变了我们的模样。送走了我们的青春，留给了我们曾经。这样的夜别样的心情，倒影的年华。深夜想用文字表达我内心的段落，可是终究写不出整个心情。背着这些流年在岁月里流浪，终究没有安静的场所。来安放我这沉淀的一切，似乎不能放也不能放。因为只有装进心里，才最为合适。也没有地方比装进心里，更安全。就这样让这段流年，从此埋在。有一段青春，留作永恒。剪一段时光，放在最美的段落。好好保存留作永远，时间过去岁月的路过。只是多了一道曾经，流年一路改变了我们的模样。送走了我们的青春，留给了我们曾经。这样的夜别样的心情，倒影的年华。深夜想用文字表达我内心的段落，可是终究写不出整个心情。背着这些流年在岁月里流浪，终究没有安静的场所。来安放我这沉淀的一切，似乎不能放也不能放。因为只有装进心里，才最为合适。也没有地方比装进心里，更安全。就这样让这段流年，从此埋在。有一段青春，留作永恒。剪一段时光，放在最美的段落。好好保存留作永远，时间过去岁月的路过。只是多了一道曾经，流年一路改变了我们的模样。送走了我们的青春，留给了我们曾经。这样的夜别样的心情，倒影的年华。深夜想用文字表达我内心的段落，可是终究写不出整个心情。背着这些流年在岁月里流浪，终究没有安静的场所。来安放我这沉淀的一切，似乎不能放也不能放。因为只有装进心里，才最为合适。也没有地方比装进心里，更安全。就这样让这段流年，从此埋在。"]
        isRefresh:true];
}

- (void)setData:(NSArray <NSString *>*)datas isRefresh:(BOOL)isRefresh {
    
    LLTableSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [self.adapter buildAddNewSection];
    }
    if (isRefresh) {
        [section.datas removeAllObjects];
    }
    for (NSInteger idx = 0; idx < datas.count; idx ++) {
        LLTableCell *cell = [section buildAddCell];
        
        cell.loadType = LLCellLoadTypeInner;
        cell.cellClazz = NSClassFromString(@"SimpleCellView");
        cell.text = datas[idx];
        cell.separatorStyle = LLTableViewCellSeparatorStyleCustom;
        cell.separatorInset = UIEdgeInsetsMake(10, 10, 0, 10);
        [cell.kvcExt setObject:[UIColor redColor] forKey:@"titleLab.textColor"];
        
    }
    [self.adapter reloadData];
}

@end
