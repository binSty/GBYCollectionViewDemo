//
//  GBYIGListKitViewController.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/26.
//

#import "GBYIGListKitViewController.h"
#import "GBYHeadSectionController.h"
#import "GBYMessageSectionController.h"
#import "GBYCycleSectionController.h"
#import "GBYDynamicSectionControlller.h"
#import "GBYHomeNewsSectionController.h"

#import "GBYIGListKitViewModel.h"
#import "GBYLevelModel.h"
#import "GBYHomeConst.h"

@interface GBYIGListKitViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) GBYIGListKitViewModel *viewModel;

@end

@implementation GBYIGListKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[GBYIGListKitViewModel alloc] init];
    
}

- (void)iglistCreateCollectionView {
    IGListCollectionViewLayout *layout = [self iglistCreateLayout];
    self.collectionView =
    [[UICollectionView alloc] initWithFrame:CGRectZero
                       collectionViewLayout:layout];
    self.collectionView.backgroundColor = UIColorFromRGB(0xF5F5F5);
    self.collectionView.frame = CGRectMake(0, 0, kScreenW, kScreenH - kTabbarHeight);
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.collectionView.alwaysBounceVertical = YES;
    self.adapter =
    [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init]
                            viewController:self];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    self.adapter.collectionView.showsVerticalScrollIndicator = NO;
    self.adapter.scrollViewDelegate = self;
    [self.view addSubview:self.collectionView];

}


- (IGListCollectionViewLayout *)iglistCreateLayout {
    IGListCollectionViewLayout *layout =
    [[IGListCollectionViewLayout alloc] initWithStickyHeaders:NO
                                              topContentInset:CGFLOAT_MIN
                                                stretchToEdge:NO];
    return layout;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.viewModel.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    GBYLevelModel *levelModel = (GBYLevelModel *)object;
    if ([levelModel.levelSting isEqualToString:kGBYLevelHomeHeader]) {
        return [[GBYHeadSectionController alloc] init];
    } else if ([levelModel.levelSting isEqualToString:kGBYLevelHomeMessage]) {
        return [[GBYMessageSectionController alloc] init];
    } else if ([levelModel.levelSting isEqualToString:kGBYLevelHomeCycleScroll]) {
        return [[GBYCycleSectionController alloc] init];
    } else if ([levelModel.levelSting isEqualToString:kGBYLevelHomeDynamic]) {
        return [[GBYDynamicSectionControlller alloc] init];
    } else if ([levelModel.levelSting isEqualToString:kGBYLevelHomeNews]) {
        GBYHomeNewsSectionController *newSection = [[GBYHomeNewsSectionController alloc] init];
        return newSection;
    }
    return nil;
}

/// 当 model 数组为空时应该显示的空态页面
- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

@end
