//
//  GBYDynamicSectionControlller.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/27.
//

#import "GBYDynamicSectionControlller.h"
#import "GBYHomeDynamicCollectionViewCell.h"
#import "GBYListMessageModel.h"
#import "GBYLevelModel.h"
#import "GBYSectionHeaderView.h"

@interface GBYDynamicSectionControlller () <IGListSupplementaryViewSource>

@property (nonatomic, strong) GBYLevelModel *levelModel;

@end

@implementation GBYDynamicSectionControlller

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
    GBYHomeDynamicCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[GBYHomeDynamicCollectionViewCell class] forSectionController:self atIndex:index];
    if (self.levelModel.dynamicArray.count > index) {
        if ([self.levelModel.dynamicArray[index] isKindOfClass:[NSDictionary class]]) {
            [cell bindViewModelArray:self.levelModel.dynamicArray];
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
        headerView.sectionHeaderLabel.text = @"动态消息提醒";
        return headerView;
    }else {
        return nil;
    }
}

@end
