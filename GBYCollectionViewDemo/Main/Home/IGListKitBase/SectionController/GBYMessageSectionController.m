//
//  GBYMessageSectionController.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/27.
//

#import "GBYMessageSectionController.h"
#import "GBYLevelModel.h"
#import "BGYMessageCollectionViewCell.h"

@interface GBYMessageSectionController ()

@property (nonatomic, strong) GBYLevelModel *levelModel;

@end

@implementation GBYMessageSectionController

- (NSInteger)numberOfItems {
    return self.levelModel.numberOfItems;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return self.levelModel.itemSize;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    BGYMessageCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[BGYMessageCollectionViewCell class] forSectionController:self atIndex:index];
    cell.backgroundColor = [UIColor whiteColor];
    if (self.levelModel.messageArray.count > index) {
        [cell bindViewModelArray:self.levelModel.messageArray];
    }
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.levelModel = object;
    self.inset = self.levelModel.sectionEdgeInsets;
    self.minimumLineSpacing = self.levelModel.sectionLineSpacing;
    self.minimumInteritemSpacing = self.levelModel.sectionItemSpacing;
}

@end
