//
//  minTransformVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/23.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "minTransformVC.h"

@interface minTransformVC ()

@end

@implementation minTransformVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //设置view
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kGetViewWidth(self.view)/2, 100, 80, 80)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
  
    //创建一个单位变换矩阵
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    //缩放50%
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    
    //再旋转30度
    transform = CGAffineTransformRotate(transform, RADIANS_TO_DEGREES(30));
    
    
    view.layer.affineTransform = transform;
  
}
@end
