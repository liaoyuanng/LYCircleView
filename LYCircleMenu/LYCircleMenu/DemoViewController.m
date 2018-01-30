//
//  DemoViewController.m
//  LYCircleMenu
//
//  Created by Ju Liaoyuan on 2018/1/29.
//  Copyright © 2018年 J. All rights reserved.
//

#import "DemoViewController.h"
#import "LYCircleView.h"

@interface DemoViewController ()<LYCircleViewDelegate>

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LYCircleView *circleView = [[LYCircleView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    circleView.center = self.view.center;
    circleView.delegate = self;
    circleView.normalImages = @[[UIImage imageNamed:@"navigate_up"],[UIImage imageNamed:@"navigate_left"],[UIImage imageNamed:@"navigate_down"],[UIImage imageNamed:@"navigate_right"],[UIImage imageNamed:@"ok"]];
    
    // colors form https://github.com/ViccAlexander/Chameleon
    circleView.highlightImages = @[[UIColor colorWithRed:255/255.0 green:201/255.0 blue:62/255.0 alpha:1],
                                   [UIColor colorWithRed:3/255.0 green:156/255.0 blue:215/255.0 alpha:1],
                                   [UIColor colorWithRed:0/255.0 green:205/255.0 blue:121/255.0 alpha:1],
                                   [UIColor colorWithRed:114/255.0 green:98/255.0 blue:192/255.0 alpha:1],
                                   [UIColor colorWithRed:0/255.0 green:190/255.0 blue:158/255.0 alpha:1]];
    
    circleView.backgroundColors = @[[UIColor colorWithRed:255/255.0 green:162/255.0 blue:52/255.0 alpha:1],
                                    [UIColor colorWithRed:0/255.0 green:131/255.0 blue:181/255.0 alpha:1],
                                    [UIColor colorWithRed:0/255.0 green:175/255.0 blue:103/255.0 alpha:1],
                                    [UIColor colorWithRed:89/255.0 green:75/255.0 blue:158/255.0 alpha:1],
                                    [UIColor colorWithRed:0/255.0 green:162/255.0 blue:134/255.0 alpha:1]];
    circleView.imageOffset = 100;
    circleView.itemInsert = 0;
    
    [self.view addSubview:circleView];
}

- (void)circleView:(LYCircleView *)circleView didClickedItem:(LYCircleItem *)item {
    NSLog(@"%d",(int)item.type);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
