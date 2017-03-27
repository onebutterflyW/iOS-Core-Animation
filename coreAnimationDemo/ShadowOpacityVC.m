//
//  ShadowOpacityVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/22.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "ShadowOpacityVC.h"

@interface ShadowOpacityVC ()

@end

@implementation ShadowOpacityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //shadowView为设置图层阴影的外图层
    UIView *shadowView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, kGetViewWidth(self.view)/2, 200)];
    [self.view addSubview:shadowView];
    shadowView.layer.shadowOpacity = 0.5f;
    shadowView.layer.shadowOffset  = CGSizeMake(10, 10);
    shadowView.layer.shadowRadius  = 10;
    
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(50, 100, kGetViewWidth(self.view)/2, 200)];
    view1.backgroundColor = [UIColor lightGrayColor];
    [shadowView addSubview:view1];//注意内图层放在外图层的内部
    
    
    //shadowOpacity阴影的透明度,在0.0(完全透明)~1.0(不透明，黑色的向左上偏的阴影)
    view1.layer.shadowOpacity = 1;
    view1.layer.shadowColor   = [UIColor blackColor].CGColor;
    //shadowOffset设置阴影的方向的偏移以及纵向的偏移,默认{0,-3}阴影显示为在上方向左偏移，CGSizeMake(10, 10);向右向下偏移
    view1.layer.shadowOffset  = CGSizeMake(10, 10);
    
    //shadowRadius设置阴影的模糊度;值越大,模糊的区域越大
    view1.layer.shadowRadius  = 10;
    
    ///////view1.layer.masksToBounds = YES;引发问题；使用两个图层
    view1.layer.masksToBounds = YES;
}

@end
