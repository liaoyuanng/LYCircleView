//
//  LYCircleView.m
//
//  Created by Ju Liaoyuan on 17/3/29.
//  Copyright © 2017年 J( https://imliaoyuan.com/ ). All rights reserved.
//

#import "LYCircleView.h"
#import "LYCircleItem.h"

static UIImage * imageWithColor(UIColor *color) {
    CGRect rect = CGRectMake(0.f, 0.f, 1.f, 1.f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return colorImage;
}

@interface LYCircleView ()

@property (nonatomic, copy) NSArray<LYCircleItem *> *items;

@end

@implementation LYCircleView

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGRect rect = frame;
        // square
        self.frame = CGRectMake(rect.origin.x, rect.origin.y, MIN(rect.size.width, rect.size.height), MIN(rect.size.width, rect.size.height));
        [self initUI];
        [self _configuration];
    }
    return self;
}

// default config
- (void)_configuration {
    self.backgroundColor = [UIColor lightGrayColor];
    self.highlightImage = UIColor.grayColor;
    self.centerItemRadius = 40.f;
    self.selectable = NO;
    self.borderColor = nil;
}

- (void)initUI {
    
    LYCircleItem *top = [LYCircleItem buttonWithType:UIButtonTypeCustom];
    top.type = kLYCircleItemTypeTop;
    [top addTarget:self action:@selector(circleItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:top];
    
    LYCircleItem *bottom = [LYCircleItem buttonWithType:UIButtonTypeCustom];
    bottom.type = kLYCircleItemTypeBottom;
    [bottom addTarget:self action:@selector(circleItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:bottom];
    
    LYCircleItem *left = [LYCircleItem buttonWithType:UIButtonTypeCustom];
    left.type = kLYCircleItemTypeLeft;
    [left addTarget:self action:@selector(circleItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:left];
    
    LYCircleItem *right = [LYCircleItem buttonWithType:UIButtonTypeCustom];
    right.type = kLYCircleItemTypeRight;
    [right addTarget:self action:@selector(circleItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:right];
    
    LYCircleItem *center = [LYCircleItem buttonWithType:UIButtonTypeCustom];
    center.type = kLYCircleItemTypeCenter;
    center.clipsToBounds = YES;
    [center addTarget:self action:@selector(circleItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:center];
    
    self.items = @[top,left,bottom,right,center];
}

#pragma mark - delegate
#pragma mark -

- (void)circleItemAction:(LYCircleItem *)sender {
    if (self.selectable) {
        sender.selected = !sender.selected;
    }

    if (self.delegate && [self.delegate respondsToSelector:@selector(circleView:didClickedItem:)]) {
        [self.delegate circleView:self didClickedItem:sender];
    }
}

#pragma mark - set item image
#pragma mark -

- (void)setNormalImage:(id)normalImage {
    NSParameterAssert(![normalImage isKindOfClass:[UIImage class]] || ![normalImage isKindOfClass:[UIColor class]]);
    
    if ([normalImage isKindOfClass:[UIImage class]]) {
        [self setNormalImages:[self repeatArray:normalImage]];
    }
    if ([normalImage isKindOfClass:[UIColor class]]) {
        [self setNormalImages:[self repeatArray:imageWithColor(normalImage)]];
    }
}

- (void)setSelectedImage:(id)selectedImage {
    NSParameterAssert(![selectedImage isKindOfClass:[UIImage class]] || ![selectedImage isKindOfClass:[UIColor class]]);
    
    if ([selectedImage isKindOfClass:[UIImage class]]) {
        [self setSelectedImages:[self repeatArray:selectedImage]];
    }
    if ([selectedImage isKindOfClass:[UIColor class]]) {
        [self setSelectedImages:[self repeatArray:imageWithColor(selectedImage)]];
    }
}

- (void)setHighlightImage:(id)highlightImage {
    NSParameterAssert([highlightImage isKindOfClass:[UIImage class]] || [highlightImage isKindOfClass:[UIColor class]]);
    
    if ([highlightImage isKindOfClass:[UIImage class]]) {
        [self setHighlightImages:[self repeatArray:highlightImage]];
    }
    if ([highlightImage isKindOfClass:[UIColor class]]) {
        [self setHighlightImages:[self repeatArray:imageWithColor(highlightImage)]];
    }
}

- (void)setNormalImages:(NSArray *)itemNormalImages {
    [self setItemImage:itemNormalImages forState:UIControlStateNormal];
}

- (void)setSelectedImages:(NSArray *)itemSelectedImages {
    [self setItemImage:itemSelectedImages forState:UIControlStateSelected];
}

- (void)setHighlightImages:(NSArray *)itemHighlightImages {
    // set hightlight state.
    [self setItemImage:itemHighlightImages forState:UIControlStateHighlighted];
    [self setItemImage:itemHighlightImages forState:UIControlStateHighlighted | UIControlStateSelected];
}

- (void)setItemImage:(NSArray *)images forState:(UIControlState)state {
    
    [self.items enumerateObjectsUsingBlock:^(LYCircleItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx >= images.count) {
            [item setBackgroundImage:nil forState:state];
            return;
        }

        if ([images[idx] isKindOfClass: [UIImage class]]) {
            if (state == UIControlStateNormal) {
                [item setImage:images[idx] forState:state];
            } else {
                [item setBackgroundImage:images[idx] forState:state];
            }
        
        }
        if ([images[idx] isKindOfClass:[UIColor class]]) {
            if (state == UIControlStateNormal) {
                [item setImage:imageWithColor(images[idx]) forState:state];
            } else {
                [item setBackgroundImage:imageWithColor(images[idx]) forState:state];
            }
        
        }
    }];
}

#pragma mark - set item background color
#pragma mark -

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [self setBackgroundColors:@[backgroundColor, backgroundColor, backgroundColor, backgroundColor, backgroundColor]];
}

- (void)setBackgroundColors:(NSArray *)backgroundColors {
    [self.items enumerateObjectsUsingBlock:^(LYCircleItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx >= backgroundColors.count) return;
        
        item.backgroundColor = backgroundColors[idx];
    }];
}

#pragma mark - set center item radius
#pragma mark -

- (void)setCenterItemRadius:(CGFloat)centerItemRadius {
    _centerItemRadius = centerItemRadius;
    
    [self.items enumerateObjectsUsingBlock:^(LYCircleItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        item.innerCircleRadius = centerItemRadius;
    }];
}

#pragma mark - set item insert
#pragma mark -

- (void)setItemInsert:(CGFloat)itemInsert {
    _itemInsert = itemInsert;
    
    [self.items enumerateObjectsUsingBlock:^(LYCircleItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        item.insert = itemInsert;
    }];
}

#pragma mark -

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.layer.cornerRadius = self.ly_width / 2.0;
    self.layer.borderColor = self.borderColor.CGColor;
    self.layer.borderWidth = self.borderWidth;
    
    CGFloat width = self.ly_height / sqrt(2);
    CGFloat offset = (self.ly_width - width) / 2.0;
    
    // Top
    self.items[0].frame = CGRectMake(offset, 0, width, self.ly_height / 2.0);
    // adjust image frame
    self.items[0].imageEdgeInsets = UIEdgeInsetsMake(0, 0, self.imageOffset, 0);
    
    // Left
    self.items[1].frame = CGRectMake(0, offset, self.ly_height / 2.0, width);
    self.items[1].imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, self.imageOffset);
    
    // Bottom
    self.items[2].frame = CGRectMake(offset, self.ly_height / 2, width, self.ly_height / 2.0);
    self.items[2].imageEdgeInsets = UIEdgeInsetsMake(self.imageOffset, 0, 0, 0);

    // Right
    self.items[3].frame = CGRectMake(self.ly_width / 2, offset, self.ly_height / 2.0, width);
    self.items[3].imageEdgeInsets = UIEdgeInsetsMake(0, self.imageOffset, 0, 0);
    
    // center
    self.items[4].frame = CGRectMake((self.ly_width / 2 - self.centerItemRadius), (self.ly_height / 2 - self.centerItemRadius), self.centerItemRadius * 2, self.centerItemRadius * 2);
}

- (CGFloat)ly_width {
    return self.frame.size.width;
}

- (CGFloat)ly_height {
    return self.frame.size.height;
}

- (NSArray *)repeatArray:(id)obj {
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSInteger count = 0; count < 5; count ++) {
        [mutableArray addObject:obj];
    }
    return mutableArray.copy;
}
@end
