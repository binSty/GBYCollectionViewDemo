//
//  GBYLevelModel.h
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/27.
//

#import "GBYIGListKitBaseModel.h"
#import "GBYListMessageModel.h"
#import <IGListDiffable.h>
#import "GBYHeadListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GBYLevelModel : GBYIGListKitBaseModel

/// 楼层 ID
@property (nonatomic, copy) NSString *levelSting;

/// 楼层内容items数组
@property (nonatomic, copy) NSArray<GBYHeadListModel*>*items;

@property (nonatomic, copy) NSString *headeImgUrlString;

@property (nonatomic, copy) NSArray *messageArray;

@property (nonatomic, copy) NSArray *cycleScrollArray;

@property (nonatomic, copy) NSArray *dynamicArray;

@property (nonatomic, copy) NSArray *newsListArray;

@property (nonatomic, assign) CGFloat headHeight;

/// 当前 section 的 item 数
@property (nonatomic, assign) NSInteger numberOfItems;

/// 当前 section 的当前行的 size
@property (nonatomic, assign) CGSize itemSize;

/// 当前 section 的 EdgeInsets
@property (nonatomic, assign) UIEdgeInsets sectionEdgeInsets;

/// 当前 section LineSpacing
@property (nonatomic, assign) CGFloat sectionLineSpacing;

/// 当前 section ItemSpacing
@property (nonatomic, assign) CGFloat sectionItemSpacing;

@end

NS_ASSUME_NONNULL_END
