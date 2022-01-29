//
//  GBYHomeNewsSectionController.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/26.
//

#import "GBYHomeNewsSectionController.h"
#import "GBYHomeNewsListCollectionViewCell.h"
#import "GBYListMessageModel.h"
#import "GBYLevelModel.h"
#import "GBYSectionHeaderView.h"

@interface GBYHomeNewsSectionController () <IGListSupplementaryViewSource>

@property (nonatomic, strong) GBYLevelModel *levelModel;

@end

@implementation GBYHomeNewsSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.supplementaryViewSource = self;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.levelModel.numberOfItems;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return self.levelModel.itemSize;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    GBYHomeNewsListCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[GBYHomeNewsListCollectionViewCell class] forSectionController:self atIndex:index];
    if (self.levelModel.newsListArray.count > index) {
        if ([self.levelModel.newsListArray[index] isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = self.levelModel.newsListArray[index];
            GBYListMessageModel *itemModel = [GBYListMessageModel mj_objectWithKeyValues:dict];
            [cell bindViewModel:itemModel];
        }
    }
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.levelModel = object;
    self.inset = self.levelModel.sectionEdgeInsets;
    self.minimumLineSpacing = self.levelModel.sectionLineSpacing;
    self.minimumInteritemSpacing = self.levelModel.sectionItemSpacing;
}

#pragma mark - IGListSupplementaryViewSource

- (CGSize)sizeForSupplementaryViewOfKind:(nonnull NSString *)elementKind atIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 50*kYY);
}

- (nonnull NSArray<NSString *> *)supportedElementKinds {
    return @[UICollectionElementKindSectionHeader];
}

- (nonnull __kindof UICollectionReusableView *)viewForSupplementaryElementOfKind:(nonnull NSString *)elementKind atIndex:(NSInteger)index {
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
        GBYSectionHeaderView *headerView =
        [self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                 
                                                  forSectionController:self
                                                                 class:[GBYSectionHeaderView class]
                                                               atIndex:index];
        headerView.sectionHeaderLabel.text = @"为你精选";
        return headerView;
    }else {
        return nil;
    }
}


@end
