//
//  GBYIGListKitBaseModel.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/26.
//

#import "GBYIGListKitBaseModel.h"

@implementation GBYIGListKitBaseModel

- (nonnull id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return [self isEqual:object];
}

@end
