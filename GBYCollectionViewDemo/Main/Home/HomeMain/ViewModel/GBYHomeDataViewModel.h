//
//  GBYHomeDataViewModel.h
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/27.
//

#import <Foundation/Foundation.h>
#import "GBYIGListKitViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GBYHomeDataViewModel : GBYIGListKitViewModel

- (RACSignal *)getHomeDataSignal;

@end

NS_ASSUME_NONNULL_END
