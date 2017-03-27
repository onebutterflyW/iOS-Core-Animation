//
//  CABasicAnimationVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/26.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "CABasicAnimationVC.h"

@interface CABasicAnimationVC ()
{
    CALayer *colorLayer;

}
@end

@implementation CABasicAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //创建图层
    colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(50, 100, 100, 100);
    colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:colorLayer];
    
    //创建button
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 250, 150, 80)];
    btn.layer.borderWidth = 3.0;
    [btn setTitle:@"changeColor" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}


-(void)btnTap{


    //创建一个随机的颜色
    CGFloat red   = arc4random()/(CGFloat)INT_MAX;
    CGFloat green = arc4random()/(CGFloat)INT_MAX;
    CGFloat blue  = arc4random()/(CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];

    //创建属性动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id)color.CGColor;
    animation.delegate = self;
    
  
    
    //将动画应用到layer
    [colorLayer addAnimation:animation forKey:nil];
    
}



//必须添加animationDidStop:finished方法，动画结束之后来更新图层的backgroundColor。否则点击按钮之后闪一下颜色，最终还是蓝色；注意第一参数是CABasicAnimation类型
-(void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag{

    [CATransaction begin];
    
    //关闭隐式动画,否则动画会发生两次
    [CATransaction setDisableActions:YES];
     colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
    
    
    [CATransaction commit];


}




@end
