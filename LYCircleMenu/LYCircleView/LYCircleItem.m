//
//  LYCircleItem.m
//
//  Created by Ju Liaoyuan on 17/3/29.
//  Copyright © 2017年 J( https://imliaoyuan.com/ ). Ltd. All rights reserved.
//

#import "LYCircleItem.h"

// act convert to radian, I = r * α.
static CGFloat arcToRadian(CGFloat arc, CGFloat radius) {
    CGFloat a = arc / radius;
    return a;
}

/*
 *  NOTE: Dividing by 2, because two adjacent items share this spacing.
 */
#define OUTSIDE_INSERT arcToRadian(self.insert / 2.0, self.ly_height)
#define INSIDE_INSERT arcToRadian(self.insert / 2.0, self.innerCircleRadius)

@interface LYCircleItem ()

@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation LYCircleItem

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _configuration];
    }
    return self;
}

- (void)_configuration {
    self.adjustsImageWhenHighlighted = NO;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGPoint center = CGPointZero;
    UIBezierPath *path = [UIBezierPath bezierPath];
    switch (self.type) {
        case kLYCircleItemTypeTop:
        {
            // center
            center = CGPointMake(self.ly_width / 2, self.ly_height);
            // add arc
            [path addArcWithCenter:center radius:self.ly_height startAngle: - M_PI_4 - OUTSIDE_INSERT endAngle: - M_PI_2 - M_PI_4 + OUTSIDE_INSERT clockwise:NO];
            if (self.innerCircleRadius > 0) {
                [path addArcWithCenter:center radius:self.innerCircleRadius startAngle:M_PI + M_PI_4 + INSIDE_INSERT endAngle:2 * M_PI - M_PI_4 - INSIDE_INSERT clockwise:YES];
            }
        }
            break;
        case kLYCircleItemTypeLeft:
        {
            center = CGPointMake(self.ly_width, self.ly_height / 2);
            [path addArcWithCenter:center radius:self.ly_width startAngle:- M_PI_2 - M_PI_4 - OUTSIDE_INSERT endAngle:- M_PI_2 - M_PI_4 - M_PI_2 + OUTSIDE_INSERT clockwise:NO];
            if (self.innerCircleRadius > 0) {
                [path addArcWithCenter:center radius:self.innerCircleRadius startAngle:M_PI - M_PI_4 + INSIDE_INSERT endAngle:M_PI + M_PI_4 - INSIDE_INSERT clockwise:YES];
            }
        }

            break;
        case kLYCircleItemTypeRight:
        {
            center = CGPointMake(0, self.ly_height / 2);
            [path addArcWithCenter:center radius:self.ly_width startAngle: M_PI_4 - OUTSIDE_INSERT endAngle: M_PI_4 - M_PI_2 + OUTSIDE_INSERT clockwise:NO];
            if (self.innerCircleRadius > 0) {
                [path addArcWithCenter:center radius:self.innerCircleRadius startAngle:M_PI * 2 - M_PI_4 + INSIDE_INSERT endAngle:M_PI_4 - INSIDE_INSERT clockwise:YES];
            }
        }
            break;
        case kLYCircleItemTypeBottom:
        {
            center = CGPointMake(self.ly_width / 2, 0);
            [path addArcWithCenter:center radius:self.ly_height startAngle: - M_PI - M_PI_4 - OUTSIDE_INSERT endAngle: - M_PI * 2 + M_PI_4 + OUTSIDE_INSERT clockwise:NO];
            if (self.innerCircleRadius > 0) {
                [path addArcWithCenter:center radius:self.innerCircleRadius startAngle: M_PI_4 + INSIDE_INSERT endAngle:M_PI_2 + M_PI_4 - INSIDE_INSERT clockwise:YES];
            }
        }
            break;
        case kLYCircleItemTypeCenter:
        {
            center = CGPointMake(self.ly_width / 2, self.ly_height / 2);
            path = [UIBezierPath bezierPathWithArcCenter:center radius:self.innerCircleRadius - self.insert startAngle:0 endAngle:M_PI * 2 clockwise:NO];
        }
            break;
    }
    
    // close path
    path.lineCapStyle = kCGLineCapRound;
    [path closePath];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
    
    self.path = path;
}

// Ignore click events that are not on the path
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL result = [super pointInside:point withEvent:event];
    if (result) {
        if ([self.path containsPoint:point]) {
            return YES;
        }
        return NO;
    }
    return NO;
}

- (CGFloat)ly_width {
    return self.frame.size.width;
}

- (CGFloat)ly_height {
    return self.frame.size.height;
}


@end
