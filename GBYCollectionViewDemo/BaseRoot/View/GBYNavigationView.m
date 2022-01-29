//
//  GBYNavigationView.m
//  StytemThemeDemo
//
//  Created by YD_Dev_BinY on 2022/1/20.
//

#import "GBYNavigationView.h"

@implementation GBYNavigationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self navigationViewControlInit];
    }
    return self;
}

- (void)navigationViewControlInit {
    self.navigationBackView = [[UIView alloc] init];
    [self addSubview:self.navigationBackView];
    self.navigationBackView.backgroundColor = [UIColor whiteColor];
    
    self.navigationBackButton = [GBYTouchPointButton buttonWithType:UIButtonTypeCustom];
    [self.navigationBackButton addTarget:self action:@selector(navigationBackButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationBackButton setImage:[UIImage imageNamed:@"navBackBtnBlack"] forState:UIControlStateNormal];
    self.navigationBackButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.navigationBackButton.imageView.clipsToBounds = YES;
    [self addSubview:self.navigationBackButton];
    
    self.navigationTitleLabel = [[UILabel alloc] init];
    self.navigationTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationTitleLabel.font = UIDEFAULTFONTSIZE(17);
    self.navigationTitleLabel.textColor = [UIColor blackColor];
    [self addSubview:self.navigationTitleLabel];
    
    self.navigationLineView = [[UIView alloc] init];
    self.navigationLineView.backgroundColor = UIColorFromRGB(0xF5F5F5);
    [self addSubview:self.navigationLineView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.navigationBackView.frame = self.bounds;
    self.navigationBackButton.frame = CGRectMake(6*kXX, kStatusBarHeight + (kNavigationBarHeight - kStatusBarHeight - 29*kYY)/2, 29*kYY, 29*kYY);
    self.navigationTitleLabel.frame = CGRectMake(70*kXX, kStatusBarHeight + (kNavigationBarHeight - kStatusBarHeight - 30*kYY)/2, kScreenW - 140*kXX, 30*kYY);
    self.navigationLineView.frame = CGRectMake(0, kNavigationBarHeight - 1*kYY, kScreenW, 1*kYY);
}

- (void)navigationBackButtonClick:(UIButton *)sender {
    if (self.navigationBackButtonClickBlock) {
        self.navigationBackButtonClickBlock();
    }
}

@end
