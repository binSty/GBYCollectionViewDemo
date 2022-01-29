//
//  GBYIGListKitViewController.h
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/26.
//

#import "GBYBaseViewController.h"
#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GBYIGListKitViewController : GBYBaseViewController <IGListAdapterDataSource>

@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) UICollectionView *collectionView;

// 初始化创建collectionView
- (void)iglistCreateCollectionView;

///当前Layout
- (IGListCollectionViewLayout *)iglistCreateLayout;

@end

NS_ASSUME_NONNULL_END
