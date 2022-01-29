//
//  GBYHomeDynamicCollectionViewCell.h
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/28.
//

#import <UIKit/UIKit.h>
#import "GBYListMessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GBYHomeDynamicCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *newsListCellImageView;

@property (nonatomic, strong) UIImageView *newsListCellImageViewOne;

@property (nonatomic, strong) UIImageView *newsListCellImageViewTwo;

- (void)bindViewModelArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
