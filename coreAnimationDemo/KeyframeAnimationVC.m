//
//  KeyframeAnimationVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/26.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "KeyframeAnimationVC.h"

@interface KeyframeAnimationVC ()
{
    CALayer *colorLayer;

}
@end

@implementation KeyframeAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
  
    
    [self rotatteShip];
    
        
    
}

//虚拟属性的例子，对飞船旋转
-(void)rotatteShip{

    //创建容器图层
    CALayer *containerLayer = [CALayer layer];
    containerLayer.frame = CGRectMake(0, 220, kGetViewWidth(self.view), 300);
    containerLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:containerLayer];
    
    
    //添加飞船图层
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship.jpg"].CGImage;
    [containerLayer addSublayer:shipLayer];
    
    
    //翻转动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath  = @"transform.rotation";
    animation.duration = 2.0;
    animation.byValue = @(M_PI*2);
    [shipLayer addAnimation:animation forKey:nil];
    
}



//----CAKeyframeAnimation的path实现动画-------
-(void)pathAnimation{


    //创建容器图层
    CALayer *containerLayer = [CALayer layer];
    containerLayer.frame = CGRectMake(0, 220, kGetViewWidth(self.view), 300);
    containerLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:containerLayer];
    
    //创建path
    UIBezierPath *shipPath = [[UIBezierPath alloc]init];
    [shipPath moveToPoint:CGPointMake(kGetViewWidth(self.view)-20, 150)];
    [shipPath addCurveToPoint:CGPointMake(10, 150) controlPoint1:CGPointMake(280, 280) controlPoint2:CGPointMake(100,80)];
    
    //使用CAShapeLayer画路径图层
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = shipPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [containerLayer addSublayer:pathLayer];
    
    //添加ship图层
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(kGetViewWidth(self.view)-20, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship.jpg"].CGImage;
    [containerLayer addSublayer:shipLayer];
    
    //创建keyframe动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = shipPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAutoReverse;
    [shipLayer addAnimation:animation forKey:nil];
    


}

//----CAKeyframeAnimation的values实现动画-------
-(void)valuesAnimation{


    //创建图层
    colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(50, 100, 100, 100);
    colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:colorLayer];
    
    //创建button
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 150, 50)];
    btn.layer.borderWidth = 3.0;
    btn.layer.cornerRadius = 5;
    [btn setTitle:@"changeColor" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    


}




-(void)btnTap{

    NSLog(@"%s",__func__);
    
    //创建关键帧动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath  = @"backgroundColor";
    animation.duration = 2.0;
    animation.values   = @[(__bridge id)[UIColor blueColor].CGColor,
                           (__bridge id)[UIColor redColor].CGColor,
                           (__bridge id)[UIColor greenColor].CGColor,
                           (__bridge id)[UIColor blueColor].CGColor];
    animation.delegate = self;
    //应用到layer上
    [colorLayer addAnimation:animation forKey:nil];

}

/*
//动画结束后，在回调中设置属性结束时的值
-(void)animationDidStop:(CAKeyframeAnimation *)anim finished:(BOOL)flag{
    
    [CATransaction begin];
    
    //关闭隐式动画,否则动画会发生两次
    [CATransaction setDisableActions:YES];
    colorLayer.backgroundColor = (__bridge CGColorRef)anim.values[2];
    
    
    [CATransaction commit];
    
    
}

*/


@end
