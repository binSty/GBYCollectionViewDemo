//
//  GBYHomeDynamicCollectionViewCell.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/28.
//

#import "GBYHomeDynamicCollectionViewCell.h"

@implementation GBYHomeDynamicCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createCellInit];
    }
    return self;
}

- (void)createCellInit {
    [self.contentView addSubview:self.newsListCellImageView];
    [self.contentView addSubview:self.newsListCellImageViewOne];
    [self.contentView addSubview:self.newsListCellImageViewTwo];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    [self.newsListCellImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
    }];
    [self.newsListCellImageViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.newsListCellImageView.mas_right).offset(6*kXX);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo((height - 6*kYY)/2);
    }];
    [self.newsListCellImageViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newsListCellImageViewOne.mas_bottom).offset(6*kYY);
        make.left.equalTo(self.newsListCellImageView.mas_right).offset(6*kXX);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo((height - 6*kYY)/2);
    }];
}


- (void)bindViewModelArray:(NSArray *)array {
    [self.newsListCellImageView sd_setImageWithURL:[NSURL URLWithString:array.count > 0 ? array[0][@"cellImageViewUrlString"] : @""]];
    [self.newsListCellImageViewOne sd_setImageWithURL:[NSURL URLWithString:array.count > 1 ? array[1][@"cellImageViewUrlString"] : @""]];
    [self.newsListCellImageViewTwo sd_setImageWithURL:[NSURL URLWithString:array.count > 2 ? array[2][@"cellImageViewUrlString"] : @""]];
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

- (UIImageView *)newsListCellImageViewOne {
    if (!_newsListCellImageViewOne) {
        _newsListCellImageViewOne = [[UIImageView alloc] init];
        _newsListCellImageViewOne.layer.cornerRadius = 5*kYY;
        _newsListCellImageViewOne.layer.masksToBounds = YES;
        _newsListCellImageViewOne.contentMode = UIViewContentModeScaleAspectFill;
        _newsListCellImageViewOne.clipsToBounds = YES;
    }
    return _newsListCellImageViewOne;
}

- (UIImageView *)newsListCellImageViewTwo {
    if (!_newsListCellImageViewTwo) {
        _newsListCellImageViewTwo = [[UIImageView alloc] init];
        _newsListCellImageViewTwo.layer.cornerRadius = 5*kYY;
        _newsListCellImageViewTwo.layer.masksToBounds = YES;
        _newsListCellImageViewTwo.contentMode = UIViewContentModeScaleAspectFill;
        _newsListCellImageViewTwo.clipsToBounds = YES;
    }
    return _newsListCellImageViewTwo;
}

@end
