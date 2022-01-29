//
//  GBYHomeHeadCollectionViewCell.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import "GBYHomeHeadCollectionViewCell.h"

@interface GBYHomeHeadCollectionViewCell ()

@property (nonatomic, strong) UIImageView *viewTop;

@end

@implementation GBYHomeHeadCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setInit];
    }
    return self;
}

- (void)setInit {
    self.viewTop = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 200*kYY)];
    self.viewTop.image = [UIImage imageNamed:@"homeBackView"];
    [self.contentView addSubview:self.viewTop];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:layout];
    [self.contentView addSubview:self.collectionView];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = UIColorFromRGB(0xF5F5F5);
    self.collectionView.scrollEnabled = NO;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.viewTop.mas_bottom).offset(10*kYY);
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
    }];
}


@end
