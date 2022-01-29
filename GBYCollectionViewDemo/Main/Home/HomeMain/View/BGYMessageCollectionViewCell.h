//
//  BGYMessageCollectionViewCell.h
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BGYMessageCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIView *cycleView;

@property (nonatomic, strong) UILabel *messageLabel;

@property (nonatomic, strong) UIView *cycleViewOne;

@property (nonatomic, strong) UILabel *messageLabelOne;

- (void)bindViewModelArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
