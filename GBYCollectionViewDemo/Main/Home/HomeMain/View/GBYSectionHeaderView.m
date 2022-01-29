//
//  GBYSectionHeaderView.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/27.
//

#import "GBYSectionHeaderView.h"

@implementation GBYSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xF5F5F5);
        [self createViewInit];
    }
    return self;
}

- (void)createViewInit {
    [self addSubview:self.sectionHeaderLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.sectionHeaderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.centerX.centerY.equalTo(self);
    }];
}

- (UILabel *)sectionHeaderLabel {
    if (!_sectionHeaderLabel) {
        _sectionHeaderLabel = [[UILabel alloc] init];
        _sectionHeaderLabel.textColor = UIColorFromRGB(0x333333);
        _sectionHeaderLabel.font = UIMEDIUMTFONTSIZE(16);
    }
    return _sectionHeaderLabel;
}
@end
