//
//  GBYPageControl.h
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, GBYPageControlDirectionType) {
    GBYPageControlDirectionTypeCenter = 0,
};

@interface GBYPageControl : UIControl

// 其他点是高度的倍数,默认1
@property(nonatomic) NSInteger otherMultiple;

// 当前点h是高度的倍数,默认2
@property(nonatomic) NSInteger currentMultiple;

// 分页数量
@property(nonatomic) NSInteger numberOfPages;

// 当前点所在下标
@property(nonatomic) NSInteger currentPage;

// 控件位置,默认中间
@property (nonatomic, assign) GBYPageControlDirectionType directionType;

// 点的大小
@property(nonatomic) NSInteger controlSize;

// 点的间距
@property(nonatomic) NSInteger controlSpacing;

// 其他未选中点颜色
@property(nonatomic,strong) UIColor *otherColor;

// 当前点颜色
@property(nonatomic,strong) UIColor *currentColor;

// 当前点背景图片
@property(nonatomic,strong) UIImage *currentBkImg;

// 其他点背景图片
@property(nonatomic,strong) UIImage *otherBkImg;

@end

NS_ASSUME_NONNULL_END
