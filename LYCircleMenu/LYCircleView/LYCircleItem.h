//
//  LYCircleItem.h
//
//  Created by Ju Liaoyuan on 17/3/29.
//  Copyright © 2017年 J( https://imliaoyuan.com/ ). All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LYCircleItemType) {
    kLYCircleItemTypeTop,
    kLYCircleItemTypeBottom,
    kLYCircleItemTypeLeft,
    kLYCircleItemTypeRight,
    kLYCircleItemTypeCenter
};

@interface LYCircleItem : UIButton

@property (nonatomic, assign) LYCircleItemType type;

@property (nonatomic, assign) CGFloat innerCircleRadius;

@property (nonatomic, assign) CGFloat insert;

- (CGFloat)ly_width;
- (CGFloat)ly_height;

@end
