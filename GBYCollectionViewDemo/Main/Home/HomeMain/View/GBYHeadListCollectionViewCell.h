//
//  GBYHeadListCollectionViewCell.h
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import <UIKit/UIKit.h>
#import <IGListBindable.h>
#import "GBYHeadListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GBYHeadListCollectionViewCell : UICollectionViewCell <IGListBindable>

- (void)bindViewModel:(GBYHeadListModel *)viewModel;

@property (nonatomic, strong) UIImageView *cellImgView;

@property (nonatomic, strong) UILabel *cellBottomLb;

@end

NS_ASSUME_NONNULL_END
