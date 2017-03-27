//
//  presentationAndModelVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/26.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//


#import "presentationAndModelVC.h"

@interface presentationAndModelVC ()
{

    CALayer *colorLayer;

}
@end

@implementation presentationAndModelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建红色的layer
    colorLayer = [CALayer layer];
    colorLayer.frame    = CGRectMake(0, 0, 100, 100);
    colorLayer.position = CGPointMake(kGetViewWidth(self.view)/2, kGetViewHeight(self.view)/2);
    colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:colorLayer];
    
}

//实现的效果是点击屏幕上的任何位置将图层平移到那里；点击图层本身可以随机改变它的颜色。
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    //获得触摸点
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    //核对是否点击了移动中的layer
    if ([colorLayer.presentationLayer hitTest:point]) {
        
        //随机改变layer的背景色
        CGFloat red   = arc4random()/(CGFloat)INT_MAX;
        CGFloat green = arc4random()/(CGFloat)INT_MAX;
        CGFloat blue  = arc4random()/(CGFloat)INT_MAX;
        colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
        
    }else{
    
        //否则将layer移动到新位置
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        colorLayer.position = point;
        [CATransaction commit];
    
    }



}



@end
