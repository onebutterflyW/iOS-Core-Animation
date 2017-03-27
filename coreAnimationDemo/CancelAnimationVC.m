//
//  CancelAnimationVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/27.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "CancelAnimationVC.h"

@interface CancelAnimationVC ()
{

    UIView *containerView;
    CALayer    *shipLayer;

}
@end

@implementation CancelAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建容器图层
    containerView = [[UIView alloc]init];
    containerView.frame = CGRectMake(0, 120, kGetViewWidth(self.view), 300);
    containerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:containerView];
    
    
    //创建shipLayer图层
    shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship.jpg"].CGImage;
    [containerView.layer addSublayer:shipLayer];
    
    
    //创建开始按钮
    UIButton *startBtn = [self createBtnWithTitle:@"开始"];
    startBtn.center = CGPointMake(kGetViewWidth(self.view)/2-100, 500);
    [startBtn addTarget:self action:@selector(startBtnTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    NSLog(@"startBtn=%@",startBtn);
    
    //创建结束按钮
    UIButton *endBtn = [self createBtnWithTitle:@"结束"];
    endBtn.center = CGPointMake(kGetViewWidth(self.view)/2+100, 500);
    [endBtn addTarget:self action:@selector(endBtnTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:endBtn];
    NSLog(@"endBtn=%@",endBtn);
   
}


-(UIButton *)createBtnWithTitle:(NSString *) title{

    NSLog(@"dfsf");
    
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(0, 0, 150, 60);
    [btn setTitle:title forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor lightGrayColor];

    return btn;
}


-(void)startBtnTap{

    //旋转ship
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath  = @"transform.rotation";
    animation.duration = 4.0;
    animation.byValue  = @(M_PI * 2);
    animation.delegate = self;
    [shipLayer addAnimation:animation forKey:@"rotationAnimation"];

}


-(void)endBtnTap{
    
    [shipLayer removeAnimationForKey:@"rotationAnimation"];

}

#pragma 代理方法
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{

    NSLog(@"动画停止，finished=%@",flag?@"yes":@"no");

}


@end
