//
//  GBYCycleScrollView.h
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import <UIKit/UIKit.h>
#import "GBYCycleModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^GBYCycleScrollControlTapClickBlock)(NSInteger current);

@interface GBYCycleScrollView : UIView

@property (nonatomic, copy) GBYCycleScrollControlTapClickBlock tapClickBlock;

/// 数据源model
@property (nonatomic, strong) NSArray<GBYCycleModel *> *models;

@end

NS_ASSUME_NONNULL_END
