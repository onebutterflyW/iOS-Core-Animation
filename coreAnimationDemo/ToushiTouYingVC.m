//
//  ToushiTouYingVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/23.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "ToushiTouYingVC.h"

@interface ToushiTouYingVC ()

@end

@implementation ToushiTouYingVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //设置view
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kGetViewWidth(self.view)/2-50, 150, 80, 150)];
    [self.view addSubview:view];
    UIImage *image       = [UIImage imageNamed:@"1.jpg"];
    view.layer.contents  = (__bridge id)image.CGImage;
    
    
    //创建单位juzhen
    CATransform3D transform = CATransform3DIdentity;
    
    //应用透视perspective,改变单位矩阵的m34的值
    transform.m34 = -1.0/50.0;
    
    //顺着Y轴旋转45度
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    
    view.layer.transform = transform;
    

}



@end
