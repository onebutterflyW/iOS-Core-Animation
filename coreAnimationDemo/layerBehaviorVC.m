//
//  layerBehaviorVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/24.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "layerBehaviorVC.h"

@interface layerBehaviorVC ()
{
    UIView *layerView;

    CALayer *colorLayer;
}
@end

@implementation layerBehaviorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    layerView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    layerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:layerView];
    
    
    //创建图层
    colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(50, 50, 100, 100);
    colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [layerView.layer addSublayer:colorLayer];
    
    
    
    //给图层添加一个自定义的行为
    CATransition *transition =[CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    colorLayer.actions = @{@"backgroundColor":transition};
    
    
    //创建按钮，改变颜色
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 350, 200, 80)];
    [btn setTitle:@"change color" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(tapBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    /*
    //测试在动画块外图层的行为action
    NSLog(@"outside:%@",[layerView actionForLayer:layerView.layer forKey:@"backgroundColor"]);
    
    //开始动画块
    [UIView beginAnimations:nil context:nil];
    
    //在动画块内测试图层的action
    NSLog(@"inside:%@",[layerView actionForLayer:layerView.layer forKey:@"backgroundColor"]);
    
    //结束动画块
    [UIView commitAnimations];
    
    */
}

//按钮事件
-(void)tapBtn{
    

   
    //随机改变图层背景的颜色
    CGFloat red   = arc4random()/(CGFloat)INT_MAX;
    CGFloat green = arc4random()/(CGFloat)INT_MAX;
    CGFloat blue  = arc4random()/(CGFloat)INT_MAX;
    
    colorLayer.backgroundColor=[UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    
}
@end
