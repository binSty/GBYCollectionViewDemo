//
//  GBYIGListKitViewModel.h
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GBYIGListKitViewModel : NSObject

// 数据源数组
@property (nonatomic, strong) NSMutableArray *dataArray;

///处理楼层数据信息
- (void)iglistLoadWeightDataModel:(NSArray *)modelArray;

@end

NS_ASSUME_NONNULL_END
