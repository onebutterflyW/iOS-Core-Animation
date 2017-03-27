//
//  CornerRadiusVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/22.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "CornerRadiusVC.h"

@interface CornerRadiusVC ()

@end

@implementation CornerRadiusVC

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
    
    //设置view1的图片后，虽然设置着cornerRadius但没有效果
    //UIImage *image = [UIImage imageNamed:@"jj.jpg"];
    //view1.layer.contents = (__bridge id)image.CGImage;
    
    //设置view2的maskToBounds
    view2.layer.masksToBounds = YES;
   
    
    //通过两个视图的对比，可以说明cornerRadius可以设置图层的曲率，进而达到设置圆角的目的；view1的图片说明CornerRadius只影响背景颜色而不影响背景图片或子图层
    
    
}



@end
