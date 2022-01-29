//
//  GBYHeadSectionController.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import "GBYHeadSectionController.h"
#import "GBYHeadeListSectionController.h"
#import "GBYHomeHeadCollectionViewCell.h"
#import "GBYLevelModel.h"
#import "GBYHeadListModel.h"
#import <IGListKit/IGListKit.h>
#import "UIView+BYFrame.h"

@interface GBYHeadSectionController () <IGListAdapterDataSource>

@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) GBYLevelModel *levelModel;

@end

@implementation GBYHeadSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.adapter =
        [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new]
                                viewController:self.viewController];
        self.adapter.dataSource = self;
    }
    return self;
}

- (void)didUpdateToObject:(id)object {
    self.levelModel = object;
    self.inset = self.levelModel.sectionEdgeInsets;
    self.minimumLineSpacing = self.levelModel.sectionLineSpacing;
    self.minimumInteritemSpacing = self.levelModel.sectionItemSpacing;
}

#pragma mark - IGListSectionController Overrides
- (NSInteger)numberOfItems {
    return self.levelModel.numberOfItems;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return self.levelModel.itemSize;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    const Class cellClass = [GBYHomeHeadCollectionViewCell class];
    GBYHomeHeadCollectionViewCell *headerCell =
    (GBYHomeHeadCollectionViewCell *)[self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    self.adapter.collectionView = headerCell.collectionView;
    return headerCell;
}

#pragma mark - IGListAdapterDataSource

- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    GBYHeadListModel *itemModel = (GBYHeadListModel *)object;
    if ([itemModel.levelString isEqualToString:kGBYLevelHomeHeader]) {
        return [GBYHeadeListSectionController new];
    }
    return nil;
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.levelModel.items;
}

@end
