//
//  SimpleTableViewController.m
//  LTableViewAdapterExample
//
//  Created by ylin on 17/3/8.
//  Copyright © 2017年 ylin.yang. All rights reserved.
//

#import "SimpleTableViewController.h"
#import <LTableViewAdapter/LTableViewAdapter.h>

@interface SimpleTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *simpleTable;
@property (strong, nonatomic) TableViewAdapter *adapter;

@end

@implementation SimpleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    ///初始化适配器
    TableViewAdapter *adapter = [[TableViewAdapter alloc] initWithTableView:self.simpleTable];
    self.adapter = adapter;
    
    self.simpleTable.estimatedRowHeight = 44;
    self.simpleTable.rowHeight = UITableViewAutomaticDimension;
    ///设置数据
    [self setData:@[
                    @"有一段青春，留作永恒。剪一段时光，放在最美的段落。好好保存留作永远，时间过去岁月的路过。只是多了一道曾经，流年一路改变了我们的模样。送走了我们的青春，留给了我们曾经。这样的夜别样的心情，倒影的年华。深夜想用文字表达我内心的段落，可是终究写不出整个心情。背着这些流年在岁月里流浪，终究没有安静的场所。来安放我这沉淀的一切，似乎不能放也不能放。因为只有装进心里，才最为合适。也没有地方比装进心里，更安全。就这样让这段流年，从此埋在心里。不再提起，让时间的尽头。留作无声的永恒，\
                    \
                    　　有一段青春，埋葬的时间。总有一些人拼了命的，挽留最终还是留不住。总有一些话始终未能说出口，直至最后再也不必说出口。埋葬过去，我们有着太多的沉默。像是在时间的路刚好遇见，只是你装做什么也没看见。很多年过去了，我始终在这里执着。时间走过这里并没有，我想要的段落。也许下一段时光，会遇见一个更好的彼岸。流年划过陌路，我们终于渐行渐远。来不及说再见，也来不及为那段。往事而伤心哭泣，一切要走都是上天。许早准备好的，只待我们路过此地。\
                    　　有一段悲伤，注定成为生命当中的曲子。一路离伤一路练习，秋天的落叶只能随风而去。走远的路人只能默默祝福，也许生命是一种选择。也是一种惜缘，一路顺着时间的痕迹。找到这个叫做岁月的尽头，一路的我们只是历经一次。流年就走散这么多的随行者，时间终告诉了我们。什么叫做流年，流年却告诉了我们。什么叫做永恒，独自站在黑夜的山峰。似乎自己与这个世界隔离一般，没有声音没有吵闹。是那么的凄凉。那么的安静，那些无声的岁月。只有宁静陪伴和这安静的夜，\
                    \
                    　　珍惜的人，走过的路。我们跟着时间越走越远，身边的人身边的事。能留下来的才算是你的，一些路一些分别。时间终把那上错车的人，越送越远人生是一列车。走走停停，那里都是站，那里都有拥挤的人群。匆匆忙忙追追赶赶，一路的旅途有人坐错了车。有人坐过了站，似乎每一幕都在重演着。走过的路遇到的人，要走多久才能遇到直正对的人。这个世界真正能相遇的，真的太少。", @"有一段痛，我选择永远沉默。有些话选择不再提起，有些路选择安静走过。有些人有些情，有些时间注定。是陌路的相峰，有些人从我们生命路过。从不留下任何痕迹，有些人注定留下痕迹。但误以为别生活的悲剧，从来都没有停止过。只是换了种方式，换了个地点换了一批人。有些痛我们并不需要，向每一个人诉说。因为不是所有的痛都能说出口，有些伤真的是没有语言。可以表达只能用文字默默埋葬，这是我们的世界也是流年的见证。\
                    \
                    　　最初的你，终经历一段落幕。变成坚强的自己，带上自己的梦。终于如愿以偿，记得最开始。你还是那个好笑的那一个，转眼时间走过。我们多了几份沉默，却少了几份语言。走在相识的最初，回想那么走远的画面。仿佛就在昨天发生的一样，无言以对历在那段时光。我们总以为我们还在，只是再次回到现在早已告秋还冬。路过你忧伤的心，最初的你。只是随着时间的沉淀而沉淀，我们曾写下的模样。只是再也找不到当初的那份勇气，只是再也翻不出那份。沉默已久的流年，\
                    \
                    　　那些年，那些记忆。那些所历的每一幕。都是离别的痕迹，每一个夜上都是一个难眠的夜。有些事情，在经过了时间的沉淀之后。总会被遗忘在角落，而有些身影则相遇在风景无限的沧海。以为这样会一直走下去，当岁月划过。留下记忆的沧桑，是否会想起某个场景。触发埋藏在心底深处的泛黄，或许才明白。当初所谓的遗忘，也不过是暂时的失去记忆故事。流淌在回首之间，穾然才发现当初以为会一直。陪伴在身边的你，此时却早已不见了踪影。\
                    \
                    　　有一段落幕，经历的时间始终是一个漫长的流年。在那些散落的人群中，依然没有半点音讯，无论是时光的离别。还是远去的祝福。相信那些从离别中，来回走过一遍的漂泊者。有一大半会胜过很多千言万语，漂浮中有很多语言是不需要发出声音的。也有很多无声的流浪只有喜欢安静的爱好者才懂，很多年过去了那些一起走过的人。说好一起经历风雨，一起走过流年直到出现最后的彩虹。生命终是一次旅途，那些出现的人终是走的走散的散。最后留下来的人，才会经得起岁月流逝。才会经得起时光静好，感谢那些所离别的时光。也感谢那曾埋过的年华。感谢我脚下那几个陌生的城市，也感谢那几年所执着过的年华。"]
        isRefresh:true];
}

- (void)setData:(NSArray <NSString *>*)datas isRefresh:(BOOL)isRefresh {
    
    TableSection *section = self.adapter.sections.firstObject;
    if (!section) {
        section = [self.adapter addNewSection];
    }
    if (isRefresh) {
        [section.datas removeAllObjects];
    }
    for (NSInteger idx = 0; idx < datas.count; idx ++) {
        TableCell *cell = [section addNewCell];
        
        cell.loadType = CellLoadTypeInner;
        cell.cellClazz = NSClassFromString(@"SimpleCellView");
        cell.title = datas[idx];
        [cell.kvcExt setObject:[UIColor redColor] forKey:@"titleLab.textColor"];
        
    }
    [self.adapter reloadData];
}

@end
