//
//  layerBorderVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/22.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "layerBorderVC.h"

@interface layerBorderVC ()

@end

@implementation layerBorderVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //布局,两个view,view1以及其子视图view11，view2以及其子视图view22
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(50, 100, kGetViewWidth(self.view)/2, 200)];
    view1.backgroundColor = [UIColor lightGrayColor];
    UIView *view11 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kGetViewWidth(self.view)/3, 100)];
    view11.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    [view1 addSubview:view11];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(50, 400, kGetViewWidth(self.view)/2, 200)];
    view2.backgroundColor = [UIColor lightGrayColor];;
    UIView *view22 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kGetViewWidth(self.view)/3, 100)];
    view22.backgroundColor = [UIColor redColor];
    [self.view addSubview:view2];
    [view2 addSubview:view22];
    
    
    //设置view1，view2的Layer属性的cornerRadius
    view1.layer.cornerRadius = 20.0f;
    view2.layer.cornerRadius = 20.0f;
    
    //设置view2的maskToBounds
    view2.layer.masksToBounds = YES;
    
    //给view1，view2设置边框
    //使用图层的borderWidth是以点为单位设置边框，默认为0f
    view1.layer.borderWidth  = 5.0f;
    view2.layer.borderWidth  = 5.0f;
    
    //borderColor设置边框的颜色
    view2.layer.borderColor  = [UIColor yellowColor].CGColor;
    view22.layer.borderWidth = 5.0f;
    view22.layer.borderColor = [UIColor yellowColor].CGColor;
    
    //通过对比两个子视图的位置发现边框是绘制在自己的内部
    

}



@end
