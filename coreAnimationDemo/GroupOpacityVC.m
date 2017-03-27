//
//  GroupOpacityVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/23.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "GroupOpacityVC.h"

@interface GroupOpacityVC ()

@end

@implementation GroupOpacityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    

    
//    //布局btn1\btn2
//    UIButton *btn1 = [[UIButton alloc]init];
//    UIButton *btn2 = [[UIButton alloc]init];
//    
//    NSArray *HConstrsint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[btn1(==60)]-30-[btn2(==60)]"
//                            options:0
//                            metrics:nil
//                            views:NSDictionaryOfVariableBindings(btn1,btn2)];
//    
//    NSArray *v1Constraint = [NSLayoutConstraint
//         constraintsWithVisualFormat:@"v:|-100-[btn1(==80)]"
//                             options:0
//                             metrics:nil
//                             views:NSDictionaryOfVariableBindings(btn1)];
//    
//    NSArray *v2Constraint = [NSLayoutConstraint
//         constraintsWithVisualFormat:@"v:|-100-[btn2(==80)]"
//                             options:0
//                             metrics:nil
//                             views:NSDictionaryOfVariableBindings(btn2)];
//    
//    NSArray *constraint = @[HConstrsint,v1Constraint,v2Constraint];
//    [self.view addConstraints:constraint];
//    
//    
    
    //创建opacity(不透明)button1
    UIButton *button1 = [self customButton];
    button1.center    = CGPointMake(100, 150);
    [self.view addSubview:button1];
    
    
    //创建透明button
    UIButton *button2 = [self customButton];
    button2.center    = CGPointMake(300, 150);
    button2.alpha     = 0.5;
    [self.view addSubview:button2];
    
    
    button2.layer.shouldRasterize = YES;
    button2.layer.rasterizationScale = [UIScreen mainScreen].scale;
}


-(UIButton *)customButton
{
    //创建button
    CGRect frame  = CGRectMake(0, 0, 150, 50);
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    btn.backgroundColor    = [UIColor whiteColor];
    btn.layer.cornerRadius = 10;
    
    //添加label
    frame = CGRectMake(20, 10, 110, 30);
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
    lab.text = @"Hellw World";
    //lab.backgroundColor = [UIColor redColor];
    lab.textAlignment = NSTextAlignmentCenter;
    [btn addSubview:lab];

    return  btn;

}





@end
