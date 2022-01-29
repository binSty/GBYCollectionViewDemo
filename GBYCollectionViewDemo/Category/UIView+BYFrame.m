//
//  UIView+BYFrame.m
//  BYCycleScrollView
//
//  Created by YD_Dev_BinY on 2021/10/28.
//

#import "UIView+BYFrame.h"

@implementation UIView (BYFrame)

- (CGFloat)by_width {
    return self.frame.size.width;
}

- (void)setBy_width:(CGFloat)by_width {
    CGRect temp = self.frame;
    temp.size.width = by_width;
    self.frame = temp;
}

- (CGFloat)by_height {
    return self.frame.size.height;
}

- (void)setBy_height:(CGFloat)by_height {
    CGRect temp = self.frame;
    temp.size.height = by_height;
    self.frame = temp;
}

- (CGFloat)by_y {
    return self.frame.origin.y;
}

- (void)setBy_y:(CGFloat)by_y {
    CGRect frame = self.frame;
    frame.origin.y = by_y;
    self.frame = frame;
}

@end
