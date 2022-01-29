//
//  GBYHomeViewController.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/26.
//

#import "GBYHomeViewController.h"
#import "GBYHomeDataViewModel.h"
#import "UIView+BYFrame.h"
#import "GBYHomeSearchView.h"

@interface GBYHomeViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) GBYHomeDataViewModel *viewModel;

@property (nonatomic, strong) GBYHomeSearchView *searchView;

@end

@implementation GBYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[GBYHomeDataViewModel alloc] init];
    
    [self setHomeInit];
}

- (void)setHomeInit {
    // 创建collectionView
    [self iglistCreateCollectionView];
    [self.view addSubview:self.searchView];
    @weakify(self);
    [[self.viewModel getHomeDataSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.adapter performUpdatesAnimated:YES completion:nil];
    }];
}


#pragma mark --
#pragma mark -- UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scrollFloatY = scrollView.contentOffset.y;
    if (scrollFloatY < 0) {
        self.searchView.by_y = -scrollFloatY;
    }else {
        self.searchView.by_y = 0;
    }
}


- (GBYHomeSearchView *)searchView {
    if (!_searchView) {
        _searchView = [[GBYHomeSearchView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kNavigationBarHeight)];
        _searchView.backgroundColor = [UIColor redColor];
    }
    return _searchView;
}

@end
