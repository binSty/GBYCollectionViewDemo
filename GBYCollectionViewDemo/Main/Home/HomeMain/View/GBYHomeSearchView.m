//
//  GBYHomeSearchView.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import "GBYHomeSearchView.h"

@implementation GBYHomeSearchView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _setSearchControl];
    }
    return self;
}

- (void)_setSearchControl {
    
    self.navBackImg = [[UIImageView alloc] initWithFrame:self.bounds];
    self.navBackImg.image = [UIImage imageNamed:@"homeNavBackImg"];
    self.navBackImg.contentMode = UIViewContentModeScaleAspectFill;
    self.navBackImg.clipsToBounds = YES;
    [self addSubview:self.navBackImg];
    
    self.searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(10*kXX, kStatusBarHeight + (kNavigationBarHeight - kStatusBarHeight - 30*kYY)/2, kScreenW - 20*kXX, 30*kYY)];
    self.searchTextField.placeholder = @"搜索";
    NSMutableAttributedString *arrStr = [[NSMutableAttributedString alloc]initWithString:self.searchTextField.placeholder attributes:@{NSForegroundColorAttributeName : UIColorFromRGB(0xA0A0A0),NSFontAttributeName:UIDEFAULTFONTSIZE(14)}];
    self.searchTextField.attributedPlaceholder = arrStr;
    self.searchTextField.font = UIDEFAULTFONTSIZE(14);

    self.searchTextField.layer.cornerRadius = 5*kYY;
    UIView *letfV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32*kXX, 30*kYY)];
    UIImageView *leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_icon_search"]];
    leftImageView.frame = CGRectMake(10*kXX, 7*kYY, 16*kYY, 16*kYY);
    [letfV addSubview:leftImageView];
    self.searchTextField.leftView = letfV;
    self.searchTextField.backgroundColor = [UIColor whiteColor];
    self.searchTextField.leftViewMode = UITextFieldViewModeAlways;
    self.searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.searchTextField.userInteractionEnabled = NO;
    [self addSubview:self.searchTextField];
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesClick:)];
    [self addGestureRecognizer:tapGes];
}

- (void)tapGesClick:(UITapGestureRecognizer *)tapGes {
    if (self.searchTapBlock) {
        self.searchTapBlock();
    }
}

@end
