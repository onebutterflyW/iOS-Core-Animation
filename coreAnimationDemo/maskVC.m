//
//  maskVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/22.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "maskVC.h"

@interface maskVC ()

@end

@implementation maskVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    _layerView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0,100, 100, 100)];
    _layerView1.backgroundColor = [UIColor whiteColor];
    self.layerView1.layer.shadowOpacity = 0.5f;
    
    //给ImageView添加图像
    _layerView1.image = [UIImage imageNamed:@"jj.jpg"];
    
    
    //创建maskLayer
    CALayer *maskLayer = [CALayer layer];
    
    //给maskLayer 设定frame
    maskLayer.frame = self.layerView1.bounds;
    
    //"phone.png"为圆形图片
    UIImage *maskImage = [UIImage imageNamed:@"phone.png"];
    
    //给图层的contents添加内容
    maskLayer.contents = (__bridge id)maskImage.CGImage;

    
    self.layerView1.layer.mask = maskLayer;
    
    
    [self.view addSubview:_layerView1];
    
    
}



@end
