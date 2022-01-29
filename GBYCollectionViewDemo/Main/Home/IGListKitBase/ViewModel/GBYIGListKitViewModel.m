//
//  GBYIGListKitViewModel.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/26.
//

#import "GBYIGListKitViewModel.h"
#import "GBYLevelModel.h"
#import "GBYListMessageModel.h"
#import "GBYHeadListModel.h"

@implementation GBYIGListKitViewModel

///处理楼层数据信息
- (void)iglistLoadWeightDataModel:(NSArray *)modelArray {
    [self.dataArray removeAllObjects];
    for (GBYLevelModel *model in modelArray) {
        if ([model.levelSting isEqualToString:kGBYLevelHomeHeader]) {
            [self _igListLeverHeadModel:model];
        } else if ([model.levelSting isEqualToString:kGBYLevelHomeMessage]) {
            [self _igListLeverMessagesModel:model];
        } else if ([model.levelSting isEqualToString:kGBYLevelHomeCycleScroll]) {
            [self _igListLeverCycleScrollModel:model];
        } else if ([model.levelSting isEqualToString:kGBYLevelHomeDynamic]) {
            [self _igListLeverDynamicModel:model];
        } else if ([model.levelSting isEqualToString:kGBYLevelHomeNews]) {
            [self _igListLeverNewsModel:model];
        }
    }
}

/// 头部页
- (void)_igListLeverHeadModel:(GBYLevelModel *)model {
    model.numberOfItems = 1;
    CGFloat margin = 15*kXX;
    model.sectionEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    model.sectionLineSpacing = 0;
    model.sectionItemSpacing = 0;
    CGFloat listViewHeight = 0;
    for (GBYHeadListModel *listModel in model.items) {
        // 这里可以配置头部标题，多个section
        NSInteger count = listModel.items.count;
        listModel.numberOfItems = count;
        CGFloat singleControlHeight = (kScreenW - 2*margin - 10*kXX - 25*kXX * 4) / 5;
        // 总共几行
        CGFloat lineNum = (count - 1) / 5 + 1;
        listViewHeight = (singleControlHeight + 20*kYY) * lineNum + (lineNum - 1) * 10*kYY + 20*kYY;
        listModel.levelString = kGBYLevelHomeHeader;
        listModel.sectionEdgeInsets = UIEdgeInsetsMake(10*kYY, margin, 10*kYY, margin);
        listModel.sectionLineSpacing = 10*kYY;
        listModel.sectionItemSpacing = 25*kXX;
        listModel.itemSize = CGSizeMake(singleControlHeight, singleControlHeight + 20*kYY);
    }
    model.headHeight = listViewHeight;
    CGFloat width = kScreenW;
    CGFloat height =  210*kYY + listViewHeight;
    model.itemSize = CGSizeMake(width, height);
    [self.dataArray addObject:model];
}

/// 消息页
- (void)_igListLeverMessagesModel:(GBYLevelModel *)model {
    model.numberOfItems = 1;
    CGFloat margin = 10*kXX;
    model.sectionEdgeInsets = UIEdgeInsetsMake(10*kYY, margin, 0, margin);
    model.sectionLineSpacing = 0;
    model.sectionItemSpacing = 0;
    CGFloat width = kScreenW - margin*2;
    CGFloat height =  70*kYY;
    model.itemSize = CGSizeMake(width, height);
    [self.dataArray addObject:model];
}

/// 轮播图
- (void)_igListLeverCycleScrollModel:(GBYLevelModel *)model {
    model.numberOfItems = 1;
    CGFloat margin = 10*kXX;
    model.sectionEdgeInsets = UIEdgeInsetsMake(10*kYY, margin, 0, margin);
    model.sectionLineSpacing = 0;
    model.sectionItemSpacing = 0;
    CGFloat width = kScreenW - margin*2;
    CGFloat height =  100*kYY;
    model.itemSize = CGSizeMake(width, height);
    [self.dataArray addObject:model];
}

/// 动态
- (void)_igListLeverDynamicModel:(GBYLevelModel *)model {
    model.numberOfItems = 1;
    CGFloat margin = 10*kXX;
    CGFloat marginSpace = 6*kXX;
    model.sectionEdgeInsets = UIEdgeInsetsMake(0, margin, marginSpace, margin);
    model.sectionLineSpacing = marginSpace;
    model.sectionItemSpacing = marginSpace;
    CGFloat width = (kScreenW - margin*2 - marginSpace)/2;
    CGFloat height =  200*kYY;
    model.itemSize = CGSizeMake(width, height);
    [self.dataArray addObject:model];
}

/// 新闻列表
- (void)_igListLeverNewsModel:(GBYLevelModel *)model {
    NSUInteger count = model.newsListArray.count;
    model.numberOfItems = count;
    CGFloat margin = 10*kXX;
    CGFloat marginSpace = 6*kXX;
    model.sectionEdgeInsets = UIEdgeInsetsMake(0, margin, marginSpace, margin);
    model.sectionLineSpacing = marginSpace;
    model.sectionItemSpacing = marginSpace;
    CGFloat width = (kScreenW - margin*2 - marginSpace)/2;
    CGFloat height =  180*kYY;
    model.itemSize = CGSizeMake(width, height);
    [self.dataArray addObject:model];
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}


@end
