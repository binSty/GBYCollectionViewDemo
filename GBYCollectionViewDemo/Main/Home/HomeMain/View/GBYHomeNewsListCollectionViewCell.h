//
//  GBYHomeNewsListCollectionViewCell.h
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/27.
//

#import <UIKit/UIKit.h>
#import <IGListBindable.h>
#import "GBYListMessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GBYHomeNewsListCollectionViewCell : UICollectionViewCell <IGListBindable>

@property (nonatomic, strong) UIImageView *newsListCellImageView;

- (void)bindViewModel:(GBYListMessageModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
