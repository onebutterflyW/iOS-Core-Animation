//
//  shadowPathVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/22.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "shadowPathVC.h"

@interface shadowPathVC ()

@end

@implementation shadowPathVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(50, 100, kGetViewWidth(self.view)/2, 200)];
    view1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view1];
    
    //设置contents的内容
   // UIImage *image = [UIImage imageNamed:@"phone.png"];
   // view1.layer.contents  =  (__bridge id)image.CGImage;
  
    view1.layer.shadowOpacity = 0.5f;
    //view1设置方形的阴影路劲
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, view1.bounds);
    view1.layer.shadowPath = squarePath;
    CGPathRelease(squarePath);
    
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(50, 400, kGetViewWidth(self.view)/2, 200)];
    view2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view2];
    
    //设置contents的内容
    //UIImage *image1 = [UIImage imageNamed:@"phone.png"];
    //view2.layer.contents  =  (__bridge id)image1.CGImage;
    
    view2.layer.shadowOpacity = 0.5f;
    view2.layer.shadowRadius  =  10;
    //view2设置方形的阴影
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, view2.bounds);
    view2.layer.shadowPath = circlePath;
    CGPathRelease(circlePath);
    
}


@end
