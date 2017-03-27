//
//  tansformVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/23.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "tansformVC.h"

@interface tansformVC ()

@end

@implementation tansformVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kGetViewWidth(self.view)-80, 100, 50, 50)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    CGAffineTransform  transform = CGAffineTransformMakeRotation(M_PI_4);
    //self.view.transform = transform;
    self.view.layer.affineTransform = transform;
    
}


@end
