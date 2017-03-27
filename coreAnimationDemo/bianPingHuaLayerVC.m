//
//  bianPingHuaLayerVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/23.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "bianPingHuaLayerVC.h"



@interface bianPingHuaLayerVC ()

@end

@implementation bianPingHuaLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
 
    
    //布局,两个view,view1以及其子视图view11，view2以及其子视图view22
    UIView *view1  = [[UIView alloc]initWithFrame:CGRectMake(80, 200, 200,200)];
    UIView *view11 = [[UIView alloc]initWithFrame:CGRectMake(60, 60, 80, 80)];
   
    
    view1.backgroundColor  = [UIColor whiteColor];
    view11.backgroundColor = [UIColor lightGrayColor];
 
    [self.view addSubview:view1];
    [view1 addSubview:view11];
    
    /*
    //view1外图层绕Z轴旋转45度
    CATransform3D outerTransform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    view1.layer.transform = outerTransform;
    
    //view11外图层绕Z轴旋转45度
    CATransform3D interTransform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    view11.layer.transform = interTransform;
    */
    
    //view1外图层绕Y轴旋转45度
    CATransform3D outerTransform = CATransform3DIdentity;
    outerTransform.m34 = -1.0/500.0;
    outerTransform = CATransform3DRotate(outerTransform, M_PI_4, 0, 1, 0);
    
    view1.layer.transform = outerTransform;

    
    //view11外图层绕Y轴旋转45度
    CATransform3D inteTransform  = CATransform3DIdentity;
    inteTransform.m34  = -1.0/500.0;
    inteTransform = CATransform3DRotate(inteTransform, -M_PI_4, 0, 1, 0);
    
    view11.layer.transform = inteTransform;
    
}

@end
