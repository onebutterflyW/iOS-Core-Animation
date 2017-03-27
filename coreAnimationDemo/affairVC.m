//
//  affairVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/24.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "affairVC.h"

@interface affairVC ()
{
    UIView *layerView;
    
    CALayer *colorLayer;

}
@end

@implementation affairVC

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
    
    //创建按钮，改变颜色
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 350, 200, 80)];
    [btn setTitle:@"change color" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(tapBtn) forControlEvents:UIControlEventTouchUpInside];
   
    
}



//按钮事件
-(void)tapBtn{
    
    //开始一个新事物
    [CATransaction begin];
    
    //设置动画时间持续到1秒钟
    [CATransaction setAnimationDuration:2.0];
    
    //增加一个旋转,
    [CATransaction setCompletionBlock:^{
        
        CGAffineTransform transform = colorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        colorLayer.affineTransform = transform;
        
    }];
    

   //随机改变图层背景的颜色
    CGFloat red   = arc4random()/(CGFloat)INT_MAX;
    CGFloat green = arc4random()/(CGFloat)INT_MAX;
    CGFloat blue  = arc4random()/(CGFloat)INT_MAX;

    colorLayer.backgroundColor=[UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    
    //提交事务
    [CATransaction commit];
}

@end
