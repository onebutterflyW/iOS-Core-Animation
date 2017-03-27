//
//  AnimationGroupVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/27.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "AnimationGroupVC.h"

@interface AnimationGroupVC ()

@end

@implementation AnimationGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //创建容器图层
    CALayer *containerLayer = [CALayer layer];
    containerLayer.frame = CGRectMake(0, 100, kGetViewWidth(self.view), 400);
    containerLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:containerLayer];
    
    //创建path
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(0, 200)];
    [path addCurveToPoint:CGPointMake(kGetViewWidth(self.view), 200) controlPoint1:CGPointMake(150,100) controlPoint2:CGPointMake(kGetViewWidth(self.view)-150, 300)];
    
    //使用CAShapeLayer画路径
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.fillColor = [UIColor whiteColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    [containerLayer addSublayer:pathLayer];
    
    //添加颜色图层
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 0, 64, 64);
    colorLayer.position = CGPointMake(0, 200);
    colorLayer.backgroundColor = [UIColor greenColor].CGColor;
    [containerLayer addSublayer:colorLayer];
    
    //创建position关键帧动画
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animation];
    keyframeAnimation.keyPath = @"position";
    keyframeAnimation.path = path.CGPath;
    keyframeAnimation.rotationMode = kCAAnimationRotateAuto;
    
    //创建颜色的基础动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"backgroundColor";
    basicAnimation.toValue = (__bridge id)[UIColor redColor].CGColor;
    
    //创建组合动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[keyframeAnimation,basicAnimation];
    groupAnimation.duration = 4.0;
    
    //将动画应用到color图层
    [colorLayer addAnimation:groupAnimation forKey:nil];
    
    
}


@end
