//
//  3DDTransformVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/23.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "_DDTransformVC.h"

@interface _DDTransformVC ()

@end

@implementation _DDTransformVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置view
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kGetViewWidth(self.view)/2-50, 150, 80, 150)];
    [self.view addSubview:view];
    UIImage *image       = [UIImage imageNamed:@"1.jpg"];
    view.layer.contents  = (__bridge id)image.CGImage;
    
    //绕Y轴旋转45度
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    
    view.layer.transform    = transform;
    
}



@end
