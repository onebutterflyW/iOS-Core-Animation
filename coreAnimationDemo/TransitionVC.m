//
//  TransitionVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/27.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "TransitionVC.h"

@interface TransitionVC ()
{
    UIImageView  *imageView;
    NSArray      *imagesArr;
    UIButton     *btn ;
    UIButton     *defineBtn;

}
@end

@implementation TransitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //改变图片的button
    defineBtn = [[UIButton alloc]init];
    defineBtn.frame = CGRectMake(self.view.frame.size.width/2-80, 450, 130, 60);
    defineBtn.backgroundColor = [UIColor lightGrayColor];
    [defineBtn setTitle:@"自定义动画" forState:UIControlStateNormal];
    [defineBtn addTarget:self action:@selector(btnTapDefineTransition) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:defineBtn];
    
    
}

-(void)transitionAnimationTest{

    //显示图片的UIImageView
    imageView = [[UIImageView alloc]init];
    imageView.backgroundColor = [UIColor orangeColor];
    imageView.frame = CGRectMake(kGetViewWidth(self.view)/2-150, 100, 300, 300);
    imageView.image = [UIImage imageNamed:@"phone.png"];
    [self.view addSubview:imageView];
    
    //初始化inamge数组
    imagesArr = @[[UIImage imageNamed:@"jj.jpg"],
                  [UIImage imageNamed:@"1.jpg"],
                  [UIImage imageNamed:@"ship.jpg"],
                  [UIImage imageNamed:@"phone.png"]];
    
    
    //改变图片的button
    btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(self.view.frame.size.width/2-80, 450, 130, 60);
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"Switch image" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tapBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];


}

-(void)tapBtn{

    //CATransition,创建fade的过渡
    CATransition *transitionAn = [CATransition animation];
    transitionAn.type = kCATransitionFade;
    
    //将过度动画应用到image的关联图层中
    [imageView.layer addAnimation:transitionAn forKey:nil];
    
    //循环到下一张图
    UIImage *currentImage = imageView.image;
    NSUInteger index = [imagesArr indexOfObject:currentImage];
    index = (index + 1)%[imagesArr count];
    imageView.image = imagesArr[index];
    
    
    
    //使用UIView的+transitionWithView:duration:options:animation:提供的过度特性
    /*
    [UIView transitionWithView:imageView duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
        UIImage *currentImage = imageView.image;
        NSUInteger index = [imagesArr indexOfObject:currentImage];
        index = (index + 1)%[imagesArr count];
        imageView.image = imagesArr[index];
        
        
    } completion:^(BOOL finished) {
        
    }];
   */
}


-(void)btnTapDefineTransition
{
    
    //对当前view截图
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *coverImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //view的截图添加在self.view的前面
    UIView *coverView = [[UIImageView alloc] initWithImage:coverImage];
    [self.view addSubview:coverView];
    
    //改变self.view的背景色
    CGFloat red = arc4random()/(CGFloat)INT_MAX;
    CGFloat green = arc4random()/(CGFloat)INT_MAX;
    CGFloat blue  = arc4random()/(CGFloat)INT_MAX;
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    //定义动画
    [UIView animateWithDuration:1.0 animations:^{
        
        //缩放、旋转、淡出视图
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform = CGAffineTransformScale(transform, 0.01, 0.01);
        transform = CGAffineTransformRotate(transform, M_PI);
        coverView.transform = transform;
        //coverView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        [coverView removeFromSuperview];
        
    }];

}




@end
