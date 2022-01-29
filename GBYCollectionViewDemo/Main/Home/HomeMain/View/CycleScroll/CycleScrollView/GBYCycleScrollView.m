//
//  GBYCycleScrollView.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import "GBYCycleScrollView.h"
#import "GBYPageControl.h"
#import "UIView+BYFrame.h"

@interface GBYCycleScrollView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *mainScrollView;

@property (nonatomic, strong) UIImageView *leftImageView;

@property (nonatomic, strong) UIImageView *centerImageView;

@property (nonatomic, strong) UIImageView *rightImageView;

/** 自定义页码显示*/
@property (nonatomic, strong) GBYPageControl *pageNumControl;

/** 当前页码*/
@property (nonatomic, assign) NSInteger currentIndex;

/** 定时器*/
@property (nonatomic, strong) dispatch_source_t timer_source_t;

@end

@implementation GBYCycleScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self cycleControlInit];
    }
    return self;
}

- (void)cycleControlInit {
    
    [self addSubview:self.mainScrollView];
    [self.mainScrollView addSubview:self.leftImageView];
    [self.mainScrollView addSubview:self.centerImageView];
    [self.mainScrollView addSubview:self.rightImageView];
    
    [self addSubview:self.pageNumControl];
    
    UITapGestureRecognizer *imgTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapClick)];
    [self.mainScrollView addGestureRecognizer:imgTap];
}

- (void)setModels:(NSArray<GBYCycleModel *> *)models {
    _models = models;
    
    self.currentIndex = 0;
    [self.leftImageView sd_setImageWithURL:[self _getUrlBeforeIndex:self.currentIndex] placeholderImage:nil];
    [self.centerImageView sd_setImageWithURL:[self _getUrlAtIndex:self.currentIndex] placeholderImage:nil];
    [self.rightImageView sd_setImageWithURL:[self _getUrlNextIndex:self.currentIndex] placeholderImage:nil];
    self.pageNumControl.numberOfPages = models.count;
    self.pageNumControl.currentPage = self.currentIndex;
    
    if (self.timer_source_t) {
        dispatch_source_cancel(self.timer_source_t);
        self.timer_source_t = nil;
    }
    if (models.count > 1) {
        [self timerStartInit];
        dispatch_resume(self.timer_source_t);
    }
    self.mainScrollView.scrollEnabled = models.count > 1;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.mainScrollView.frame = CGRectMake(0, 0, self.by_width, self.by_height);
    self.leftImageView.frame = CGRectMake(0, 0, self.mainScrollView.by_width, self.mainScrollView.by_height);
    self.centerImageView.frame = CGRectMake(self.mainScrollView.by_width, 0, self.mainScrollView.by_width, self.mainScrollView.by_height);
    self.rightImageView.frame = CGRectMake(self.mainScrollView.by_width * 2, 0, self.mainScrollView.by_width, self.mainScrollView.by_height);
    
    self.mainScrollView.contentSize = CGSizeMake(self.mainScrollView.by_width * 3, 0);
    self.mainScrollView.contentOffset = CGPointMake(self.mainScrollView.by_width, 0);
    
    self.pageNumControl.frame = CGRectMake(0, self.by_height - 20, self.by_width, 10);
    self.pageNumControl.directionType = GBYPageControlDirectionTypeCenter;
    self.pageNumControl.layer.cornerRadius = 15;
    self.pageNumControl.layer.masksToBounds = YES;
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.timer_source_t) {
        dispatch_source_cancel(self.timer_source_t);
        self.timer_source_t = nil;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self timerStartInit];
    dispatch_resume(self.timer_source_t);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x / scrollView.by_width;
    NSInteger page = self.currentIndex + 1;
    if (offsetX > 1) {//往右
        if (offsetX >= 1.5) {
            page += 1;
        }
        if (page > self.models.count) {
            page = 1;
        }
    } else if (offsetX < 1) {//往左
        if (offsetX <= 0.5) {
            page -= 1;
        }
        if (page < 1) {
            page = self.models.count;
        }
    }
    self.pageNumControl.currentPage = self.currentIndex;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int index = roundf(scrollView.contentOffset.x / scrollView.by_width);
    if (index == 0) {  //向左的
        self.currentIndex--;
        if (self.currentIndex < 0) {
            self.currentIndex = self.models.count - 1;
        }
        [self.rightImageView sd_setImageWithURL:[self _getUrlNextIndex:self.currentIndex] placeholderImage:nil];
        [self.centerImageView sd_setImageWithURL:[self _getUrlAtIndex:self.currentIndex] placeholderImage:nil];
        [self.leftImageView sd_setImageWithURL:[self _getUrlBeforeIndex:self.currentIndex] placeholderImage:nil];
        self.mainScrollView.contentOffset = CGPointMake(self.mainScrollView.by_width, 0);
    } else if (index == 2) {//向右的
        self.currentIndex++;
        if (self.currentIndex >= self.models.count) {
            self.currentIndex = 0;
        }
        [self.leftImageView sd_setImageWithURL:[self _getUrlBeforeIndex:self.currentIndex] placeholderImage:nil];
        [self.centerImageView sd_setImageWithURL:[self _getUrlAtIndex:self.currentIndex] placeholderImage:nil];
        [self.rightImageView sd_setImageWithURL:[self _getUrlNextIndex:self.currentIndex] placeholderImage:nil];
        self.mainScrollView.contentOffset = CGPointMake(self.mainScrollView.by_width, 0);
    }
    self.pageNumControl.currentPage = self.currentIndex;
}

#pragma mark -- private
- (void)timerStartInit {
    self.timer_source_t = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC));
    uint64_t interval = (UInt64)(3 * NSEC_PER_SEC);
    dispatch_source_set_timer(self.timer_source_t, start, interval,0);
    dispatch_source_set_event_handler(self.timer_source_t, ^{
        [self changePageNum];
    });
}

- (void)changePageNum {
    [UIView animateWithDuration:0.25 animations:^{
        self.centerImageView.userInteractionEnabled = NO;
        self.mainScrollView.contentOffset = CGPointMake(self.mainScrollView.by_width * 2, 0);
    } completion:^(BOOL finished) {
        self.currentIndex++;
        if (self.currentIndex == self.models.count) {
            self.currentIndex = 0;
        }
        self.pageNumControl.currentPage = self.currentIndex;
        self.centerImageView.userInteractionEnabled = YES;
        [self.leftImageView sd_setImageWithURL:[self _getUrlBeforeIndex:self.currentIndex] placeholderImage:nil];
        [self.centerImageView sd_setImageWithURL:[self _getUrlAtIndex:self.currentIndex] placeholderImage:nil];
        [self.rightImageView sd_setImageWithURL:[self _getUrlNextIndex:self.currentIndex] placeholderImage:nil];
        self.mainScrollView.contentOffset = CGPointMake(self.mainScrollView.by_width, 0);
    }];
}

#pragma mrk -- method click
- (void)imageTapClick {
    if (self.tapClickBlock) {
        self.tapClickBlock(self.currentIndex);
    }
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (!newSuperview) {
        if (self.timer_source_t) {
            dispatch_source_cancel(self.timer_source_t);
            self.timer_source_t = nil;
        }
    }
}

#pragma mark --
#pragma mark -- 获取模型图片地址数据
/** 获取模型image数据*/
- (NSURL *)_getUrlBeforeIndex:(NSInteger)index {
    if (index == 0) {
        return [NSURL URLWithString:self.models.lastObject.cellImageViewUrlString];
    }else {
        return [NSURL URLWithString:self.models[index - 1].cellImageViewUrlString];
    }
}

- (NSURL *)_getUrlAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.models.count) {
        return nil;
    }else {
        return [NSURL URLWithString:self.models[index].cellImageViewUrlString];
    }
}

- (NSURL *)_getUrlNextIndex:(NSInteger)index {
    if (index == self.models.count - 1) {
        return [NSURL URLWithString:self.models.firstObject.cellImageViewUrlString];
    }else {
        return [NSURL URLWithString:self.models[index + 1].cellImageViewUrlString];
    }
}
#pragma mark --- lazy inti

- (UIScrollView *)mainScrollView {
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.scrollsToTop = NO;
        _mainScrollView.delegate = self;
        if (@available(iOS 11.0, *)) {
            _mainScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _mainScrollView;
}

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] init];
        _leftImageView.contentMode = UIViewContentModeScaleAspectFill;
        _leftImageView.clipsToBounds = YES;
    }
    return _leftImageView;
}

- (UIImageView *)centerImageView {
    if (!_centerImageView) {
        _centerImageView = [[UIImageView alloc] init];
        _centerImageView.contentMode = UIViewContentModeScaleAspectFill;
        _centerImageView.clipsToBounds = YES;
    }
    return _centerImageView;
}

- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] init];
        _rightImageView.contentMode = UIViewContentModeScaleAspectFill;
        _rightImageView.clipsToBounds = YES;
    }
    return _rightImageView;
}

- (GBYPageControl *)pageNumControl {
    if (!_pageNumControl) {
        _pageNumControl = [[GBYPageControl alloc] init];
    }
    return _pageNumControl;
}


@end
