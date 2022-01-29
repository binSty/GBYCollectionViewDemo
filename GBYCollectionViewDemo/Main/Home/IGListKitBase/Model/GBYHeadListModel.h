//
//  GBYHeadListModel.h
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import "GBYIGListKitBaseModel.h"
#import "GBYHeadListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GBYHeadListModel : GBYIGListKitBaseModel

@property (nonatomic, copy) NSArray<GBYHeadListModel*>*items;

@property (nonatomic, copy) NSString *levelString;

@property (nonatomic, copy) NSString *cellImageUrl;

@property (nonatomic, copy) NSString *cellTitle;

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
