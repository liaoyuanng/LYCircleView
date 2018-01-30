//
//  DemoViewController.m
//  LYCircleMenu
//
//  Created by Ju Liaoyuan on 2018/1/29.
//  Copyright © 2018年 J. All rights reserved.
//

#import "DemoViewController.h"
#import "LYCircleView.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LYCircleView *circleView = [[LYCircleView alloc] initWithFrame:CGRectMake(100, 20, 300, 300)];
    circleView.normalImages = @[[UIImage imageNamed:@"navigate_up"],[UIImage imageNamed:@"navigate_left"],[UIImage imageNamed:@"navigate_down"],[UIImage imageNamed:@"navigate_right"],[UIImage imageNamed:@"ok"]];
    circleView.highlightImages = @[[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor]];
    circleView.selectedImages = @[[UIColor blueColor]];
    circleView.backgroundColor = [UIColor darkGrayColor];
    circleView.imageOffset = 100;
    circleView.itemInsert = 0;
    
    
    [self.view addSubview:circleView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
