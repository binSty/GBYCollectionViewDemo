//
//  GBYHeadListCollectionViewCell.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import "GBYHeadListCollectionViewCell.h"
#import "UIView+BYFrame.h"

@implementation GBYHeadListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _setCellControl];
    }
    return self;
}

- (void)_setCellControl {
    self.cellImgView = [[UIImageView alloc] init];
    self.cellImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.cellImgView.clipsToBounds = YES;
    [self.contentView addSubview:self.cellImgView];
    
    self.cellBottomLb = [[UILabel alloc] init];
    self.cellBottomLb.textAlignment = NSTextAlignmentCenter;
    self.cellBottomLb.font = UIDEFAULTFONTSIZE(12);
    [self.contentView addSubview:self.cellBottomLb];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.cellImgView.layer.cornerRadius = (self.by_height - 20*kYY)/2;
    self.cellImgView.layer.masksToBounds = YES;
    [self.cellImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self);
        make.width.height.mas_equalTo(self.by_height - 20*kYY);
    }];
    
    [self.cellBottomLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cellImgView.mas_bottom).offset(5*kYY);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(15*kYY);
    }];
}


- (void)bindViewModel:(GBYHeadListModel *)viewModel {
    [self.cellImgView sd_setImageWithURL:[NSURL URLWithString:viewModel.cellImageUrl]];
    self.cellBottomLb.text = viewModel.cellTitle;
}


@end
