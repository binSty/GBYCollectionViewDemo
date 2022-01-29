//
//  GBYCycleSectionController.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/27.
//

#import "GBYCycleSectionController.h"
#import "GBYHomeCycleCollectionViewCell.h"
#import "GBYLevelModel.h"

@interface GBYCycleSectionController ()

@property (nonatomic, strong) GBYLevelModel *levelModel;

@end

@implementation GBYCycleSectionController

- (NSInteger)numberOfItems {
    return self.levelModel.numberOfItems;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return self.levelModel.itemSize;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    GBYHomeCycleCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[GBYHomeCycleCollectionViewCell class] forSectionController:self atIndex:index];
    if (self.levelModel.cycleScrollArray.count > index) {
        if ([self.levelModel.cycleScrollArray[index] isKindOfClass:[NSDictionary class]]) {
            [cell bindViewModelArray:self.levelModel.cycleScrollArray];
        }
    }
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.levelModel = object;
    self.inset = self.levelModel.sectionEdgeInsets;
    self.minimumLineSpacing = self.levelModel.sectionLineSpacing;
    CGFloat extractedExpr = self.levelModel.sectionItemSpacing;
    self.minimumInteritemSpacing = extractedExpr;
}



@end
