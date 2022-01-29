//
//  GBYHomeCycleCollectionViewCell.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import "GBYHomeCycleCollectionViewCell.h"
#import "GBYCycleScrollView.h"
#import "GBYCycleModel.h"

@interface GBYHomeCycleCollectionViewCell ()

@property (nonatomic, strong) GBYCycleScrollView *cycleScrollControl;

@property (nonatomic, strong) NSMutableArray *modelArray;

@end

@implementation GBYHomeCycleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = 10*kYY;
        [self cycleInit];
    }
    return self;
}

- (void)cycleInit {
    
    self.cycleScrollControl = [[GBYCycleScrollView alloc] init];
    self.cycleScrollControl.backgroundColor = [UIColor whiteColor];
    self.cycleScrollControl.layer.masksToBounds = YES;
    self.cycleScrollControl.layer.cornerRadius = 10*kYY;
    self.cycleScrollControl.tapClickBlock = ^(NSInteger current) {
        NSLog(@"click -- %ld", current);
    };
    [self.contentView addSubview:self.cycleScrollControl];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.cycleScrollControl.frame = self.contentView.bounds;

}

- (void)bindViewModelArray:(NSArray *)array {
    self.modelArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        GBYCycleModel *model = [GBYCycleModel mj_objectWithKeyValues:dic];
        [self.modelArray addObject:model];
    }
    self.cycleScrollControl.models = self.modelArray;
}

@end
