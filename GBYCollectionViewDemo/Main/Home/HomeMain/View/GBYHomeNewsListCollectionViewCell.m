//
//  GBYHomeNewsListCollectionViewCell.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/27.
//

#import "GBYHomeNewsListCollectionViewCell.h"

@implementation GBYHomeNewsListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createCellInit];
    }
    return self;
}

- (void)createCellInit {
    [self.contentView addSubview:self.newsListCellImageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.newsListCellImageView.frame = self.contentView.bounds;
}

- (void)bindViewModel:(GBYListMessageModel *)viewModel {
    [self.newsListCellImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.cellImageViewUrlString]];
}

- (UIImageView *)newsListCellImageView {
    if (!_newsListCellImageView) {
        _newsListCellImageView = [[UIImageView alloc] init];
        _newsListCellImageView.layer.cornerRadius = 5*kYY;
        _newsListCellImageView.layer.masksToBounds = YES;
        _newsListCellImageView.contentMode = UIViewContentModeScaleAspectFill;
        _newsListCellImageView.clipsToBounds = YES;
    }
    return _newsListCellImageView;
}

@end
