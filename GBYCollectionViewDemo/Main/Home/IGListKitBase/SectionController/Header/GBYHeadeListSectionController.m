//
//  GBYHeadeListSectionController.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/29.
//

#import "GBYHeadeListSectionController.h"
#import "GBYHeadListModel.h"
#import "GBYHeadListCollectionViewCell.h"

@interface GBYHeadeListSectionController ()

@property (nonatomic, strong) GBYHeadListModel *headListModel;

@end

@implementation GBYHeadeListSectionController

- (NSInteger)numberOfItems {
    return self.headListModel.numberOfItems;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return self.headListModel.itemSize;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    GBYHeadListCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[GBYHeadListCollectionViewCell class] forSectionController:self atIndex:index];
    if (self.headListModel.items.count > index) {
        GBYHeadListModel *itemModel = self.headListModel.items[index];
        [cell bindViewModel:itemModel];
    }
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.headListModel = object;
    self.inset = self.headListModel.sectionEdgeInsets;
    self.minimumLineSpacing = self.headListModel.sectionLineSpacing;
    self.minimumInteritemSpacing = self.headListModel.sectionItemSpacing;
}

@end

