//
//  BGYMessageCollectionViewCell.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import "BGYMessageCollectionViewCell.h"

@implementation BGYMessageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = 10*kYY;
        [self setInit];
    }
    return self;
}

- (void)setInit {
    [self.contentView addSubview:self.cycleView];
    [self.contentView addSubview:self.messageLabel];
    [self.contentView addSubview:self.cycleViewOne];
    [self.contentView addSubview:self.messageLabelOne];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.cycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(17*kYY);
        make.left.equalTo(self.contentView).offset(10*kXX);
        make.width.height.mas_equalTo(6*kYY);
    }];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10*kYY);
        make.left.equalTo(self.cycleView.mas_right).offset(6*kXX);
        make.right.equalTo(self.contentView).offset(-40*kXX);
        make.height.mas_equalTo(20*kYY);
    }];
    
    [self.cycleViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(47*kYY);
        make.left.equalTo(self.contentView).offset(10*kXX);
        make.width.height.mas_equalTo(6*kYY);
    }];
    
    [self.messageLabelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(40*kYY);
        make.left.equalTo(self.cycleViewOne.mas_right).offset(6*kXX);
        make.right.equalTo(self.contentView).offset(-40*kXX);
        make.height.mas_equalTo(20*kYY);
    }];
    
}

- (void)bindViewModelArray:(NSArray *)array {
    self.messageLabel.text = array.count > 0 ? array[0] : @"";
    self.messageLabelOne.text = array.count > 1 ? array[1] : @"";
}

- (UIView *)cycleView {
    if (!_cycleView) {
        _cycleView = [[UIView alloc] init];
        _cycleView.backgroundColor = [UIColor blackColor];
        _cycleView.layer.cornerRadius = 3*kYY;
    }
    return _cycleView;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.font = UIDEFAULTFONTSIZE(12);
    }
    return _messageLabel;
}

- (UIView *)cycleViewOne {
    if (!_cycleViewOne) {
        _cycleViewOne = [[UIView alloc] init];
        _cycleViewOne.backgroundColor = [UIColor blackColor];
        _cycleViewOne.layer.cornerRadius = 3*kYY;
    }
    return _cycleViewOne;
}

- (UILabel *)messageLabelOne {
    if (!_messageLabelOne) {
        _messageLabelOne = [[UILabel alloc] init];
        _messageLabelOne.font = UIDEFAULTFONTSIZE(12);
    }
    return _messageLabelOne;
}

@end
