//
//  GBYHomeDataViewModel.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/27.
//

#import "GBYHomeDataViewModel.h"
#import "GBYLevelModel.h"

@interface GBYHomeDataViewModel ()

@property (nonatomic, copy) NSArray *homeHeaderCollectionArray;

@property (nonatomic, copy) NSArray *homeCycleScrolleArray;

@property (nonatomic, copy) NSArray *homeDynamicArray;

@property (nonatomic, copy) NSArray *homeNewsListDataArray;

@property (nonatomic, strong) NSMutableArray *homeDataArray;

@end

@implementation GBYHomeDataViewModel

- (RACSignal *)getHomeDataSignal {
    
    RACSignal *headerSiganl = [self homeHeaderSignal];
    RACSignal *messageSiganl = [self homeMessageSignal];
    RACSignal *cycleSiganl = [self homeCycleScrollSignal];
    RACSignal *dynamicSignal = [self homeDynamicSignal];
    RACSignal *newsSiganl = [self homeNewsListSignal];
    /// 演示用，实际首页网络请求不会出现此类串行请求
    RACSignal *signal = [[[[headerSiganl concat:messageSiganl] concat:cycleSiganl] concat: dynamicSignal] concat:newsSiganl];
    return signal;
}
/// 头部楼层
- (RACSignal *)homeHeaderSignal {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSDictionary *dic = @{
            @"items":@[
                @{@"items":self.homeHeaderCollectionArray}
            ]
        };
        GBYLevelModel *listModel = [GBYLevelModel mj_objectWithKeyValues:dic];
        listModel.levelSting = kGBYLevelHomeHeader;
        [self.homeDataArray addObject:listModel];
        [subscriber sendNext:@"header"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{}];
    }];
    return signal;
}

/// 消息楼层
- (RACSignal *)homeMessageSignal {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        GBYLevelModel *listModel = [[GBYLevelModel alloc] init];
        listModel.messageArray = @[@"消息展示", @"消息展示内容显示，内容查看"];
        listModel.levelSting = kGBYLevelHomeMessage;
        [self.homeDataArray addObject:listModel];
        [subscriber sendNext:@"msg"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{}];
    }];
    return signal;
}

/// 轮播图楼层
- (RACSignal *)homeCycleScrollSignal {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        GBYLevelModel *listModel = [[GBYLevelModel alloc] init];
        listModel.cycleScrollArray = self.homeCycleScrolleArray;
        listModel.levelSting = kGBYLevelHomeCycleScroll;
        [self.homeDataArray addObject:listModel];
        [subscriber sendNext:@"cycle"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{}];
    }];
    return signal;
}

/// 动态楼层
- (RACSignal *)homeDynamicSignal {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        GBYLevelModel *listModel = [[GBYLevelModel alloc] init];
        listModel.dynamicArray = self.homeDynamicArray;
        listModel.levelSting = kGBYLevelHomeDynamic;
        [self.homeDataArray addObject:listModel];
        [subscriber sendNext:@"dynamic"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{}];
    }];
    return signal;
}

/// 新闻列表楼层
- (RACSignal *)homeNewsListSignal {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        GBYLevelModel *listModel = [[GBYLevelModel alloc] init];
        listModel.newsListArray = self.homeNewsListDataArray;
        listModel.levelSting = kGBYLevelHomeNews;
        [self.homeDataArray addObject:listModel];
        [self iglistLoadWeightDataModel:self.homeDataArray];
        [subscriber sendNext:@"news"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{}];
    }];
    return signal;
}

#pragma mark --
#pragma mark -- init
- (NSArray *)homeHeaderCollectionArray {
    if (!_homeHeaderCollectionArray) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int index = 20; index < 35; index++) {
            NSString *imgUrlString = [NSString stringWithFormat:@"http://qzonestyle.gtimg.cn/qzone/app/weishi/client/testimage/1024/%d.jpg", index];
            NSString *indexString = [NSString stringWithFormat:@"标题%d", index];
            NSDictionary *dict = @{@"cellImageUrl": imgUrlString, @"cellTitle": indexString};
            [array addObject:dict];
        }
        _homeHeaderCollectionArray = array;
    }
    return _homeHeaderCollectionArray;
}

- (NSArray *)homeCycleScrolleArray {
    if (!_homeCycleScrolleArray) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int index = 150; index < 154; index++) {
            NSString *imgUrlString = [NSString stringWithFormat:@"http://qzonestyle.gtimg.cn/qzone/app/weishi/client/testimage/1024/%d.jpg", index];
            NSDictionary *dict = @{@"cellImageViewUrlString": imgUrlString};
            [array addObject:dict];
        }
        _homeCycleScrolleArray = array;
    }
    return _homeCycleScrolleArray;
}

- (NSArray *)homeDynamicArray {
    if (!_homeDynamicArray) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int index = 100; index < 103; index++) {
            NSString *imgUrlString = [NSString stringWithFormat:@"http://qzonestyle.gtimg.cn/qzone/app/weishi/client/testimage/1024/%d.jpg", index];
            NSDictionary *dict = @{@"cellImageViewUrlString": imgUrlString};
            [array addObject:dict];
        }
        _homeDynamicArray = array;
    }
    return _homeDynamicArray;
}

- (NSArray *)homeNewsListDataArray {
    if (!_homeNewsListDataArray) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int index = 1; index < 9; index++) {
            NSString *imgUrlString = [NSString stringWithFormat:@"http://qzonestyle.gtimg.cn/qzone/app/weishi/client/testimage/1024/%d.jpg", index];
            NSDictionary *dict = @{@"cellImageViewUrlString": imgUrlString};
            [array addObject:dict];
        }
        _homeNewsListDataArray = array;
    }
    return _homeNewsListDataArray;
}

- (NSMutableArray *)homeDataArray {
    if (!_homeDataArray) {
        _homeDataArray = [[NSMutableArray alloc] init];
    }
    return _homeDataArray;
}

@end
