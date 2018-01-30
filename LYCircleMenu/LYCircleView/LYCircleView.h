//
//  LYCircleView.h
//
//  Created by Ju Liaoyuan on 17/3/29.
//  Copyright © 2017年 J( https://imliaoyuan.com/ ). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYCircleItem.h"

NS_ASSUME_NONNULL_BEGIN

@class LYCircleView;

@protocol LYCircleViewDelegate <NSObject>

- (void)circleView:(LYCircleView *)circleView didClickedItem:(LYCircleItem *)item;

@end

@interface LYCircleView : UIView

@property (nonatomic, weak) id<LYCircleViewDelegate> delegate;

/**
 center item radius, when we determine the radius, we can know the size of the other parts.
 default is 40.f.
 */
@property (nonatomic, assign) CGFloat centerItemRadius;

/**
 whether the item can be selected, default is NO.
 */
@property (nonatomic, assign, getter=isSelectable) BOOL selectable;

/**
 you can set item background as image or color. Follow the order of top, left, bottom and right.
 e.g.: @[image1,image2,image3,image4,[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
 Valid for all state.
 */
@property (nonatomic, copy, nullable) NSArray *normalImages;
@property (nonatomic, copy, nullable) NSArray *highlightImages;
@property (nonatomic, copy, nullable) NSArray *selectedImages;
@property (nonatomic, copy, nullable) NSArray<UIColor *> *backgroundColors;

/**
 set all item image. only support `UIColor` or `UIImage`.
 Valid for all state.
 */
@property (nonatomic, strong) id normalImage;       // default is nil.
@property (nonatomic, strong) id selectedImage;     // default is nil.
@property (nonatomic, strong) id highlightImage;    // default is gray.

// set all item background color. default is lightGrayColor.
@property (nonatomic, strong) UIColor *backgroundColor;

/**
 menu borderwith, default is 0.
 */
@property (nonatomic, assign) CGFloat borderWidth;

/**
 menu border color, defalut is nil;
 */
@property (nonatomic, copy, nullable) UIColor *borderColor;

/**
 set image offset. default is zero.
 */
@property (nonatomic, assign) CGFloat imageOffset;

/**
 the spacing between each item, default is 0
 */
@property (nonatomic, assign) CGFloat itemInsert;

@end

NS_ASSUME_NONNULL_END
