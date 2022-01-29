//
//  GBYHomeSearchView.h
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GBYHomeSearchView : UIView

@property (nonatomic, strong) UIImageView *navBackImg;

@property (nonatomic, copy) dispatch_block_t searchTapBlock;

@property (nonatomic, strong) UITextField *searchTextField;

@end

NS_ASSUME_NONNULL_END
