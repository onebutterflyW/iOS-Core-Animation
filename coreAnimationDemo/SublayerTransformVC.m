//
//  SublayerTransformVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/23.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "SublayerTransformVC.h"

@interface SublayerTransformVC ()

@end

@implementation SublayerTransformVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置容器view
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 150, kGetViewWidth(self.view)-20, 400)];
    [self.view addSubview:view];
    
    
    //设置view1
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(5, 10, kGetViewWidth(self.view)/2-20, 380)];
    [view addSubview:view1];
    UIImage *image        = [UIImage imageNamed:@"1.jpg"];
    view1.layer.contents  = (__bridge id)image.CGImage;
    
    
    //设置view2
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(kGetViewWidth(self.view)/2+5, 10, kGetViewWidth(self.view)/2-30,  380)];
    [view addSubview:view2];
    UIImage *image1       = [UIImage imageNamed:@"1.jpg"];
    view2.layer.contents  = (__bridge id)image1.CGImage;
    
    
    //对父图层即图层容器应用perspective
    CATransform3D transform      = CATransform3DIdentity;
    //改变transform的m34的值
    transform.m34 = -1.0/250.0;
    view.layer.sublayerTransform = transform;
    
    
    //对view1沿y轴旋转45度
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    view1.layer.transform    = transform1;
    
    
    //对view2沿y轴旋转45度
    CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    view2.layer.transform    = transform2;
    
    
    
}

@end
