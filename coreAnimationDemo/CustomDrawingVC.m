//
//  CustomDrawingVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/22.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "CustomDrawingVC.h"

@interface CustomDrawingVC ()

@end

@implementation CustomDrawingVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
    //创建子图层
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame    = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    //设置controller为layer的代理,放开此代码会崩溃
    //blueLayer.delegate = self;
    
    //确保背景图片的图层使用正确的scale
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.view.layer addSublayer:blueLayer];
    
    NSLog(@"agawe");
    //强制重画图层,当图层显示在屏幕上时,CALyer不会自动重绘，而是由开发者决定绘制
    [blueLayer display];
    
    
}



-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{

    //画一个红色的圆
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    //在指定区域画一个椭圆，并充满这个空间
    CGContextStrokeEllipseInRect(ctx, layer.frame);
    NSLog(@"agawe");
}




@end
