//
//  PropertyOfCAMediaTimingVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/27.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "PropertyOfCAMediaTimingVC.h"

@interface PropertyOfCAMediaTimingVC ()<UITextFieldDelegate>
{
    
    UIView      *containerView;
    CALayer         *shipLayer;
    UITextField *durationField;
    UITextField   *repeatField;
    UIButton         *startBtn;
    
}
@end

@implementation PropertyOfCAMediaTimingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
   
   // [self layoutViewOfTestDurationAndRepeatCount];
    
    [self swingDoor];
   

}

-(void)layoutViewOfTestDurationAndRepeatCount{

    
    //创建容器图层
    containerView = [[UIView alloc]init];
    containerView.frame = CGRectMake(0, 120, kGetViewWidth(self.view), 300);
    containerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:containerView];
    
    //创建shipLayer图层
    shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship.jpg"].CGImage;
    [containerView.layer addSublayer:shipLayer];
    
    
    CGFloat d = kGetViewWidth(self.view)/4;
    durationField = [[UITextField alloc]init];
    durationField.frame = CGRectMake(d, 450, 80, 50);
    [durationField setBackgroundColor:[UIColor whiteColor]];
    durationField.borderStyle = UITextBorderStyleRoundedRect;
    durationField.placeholder = @"输入duration";
    durationField.delegate = self;
    [self.view addSubview:durationField];
    
    repeatField = [[UITextField alloc]init];
    repeatField.frame = CGRectMake(d*2, 450, 80, 50);
    [repeatField setBackgroundColor:[UIColor whiteColor]];
    repeatField.borderStyle = UITextBorderStyleRoundedRect;
    repeatField.placeholder = @"重复次数";
    repeatField.delegate = self;
    [self.view addSubview:repeatField];
    
    
    
    startBtn = [[UIButton alloc]init];
    startBtn.frame = CGRectMake(d*3, 450, 80, 40);
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    startBtn.backgroundColor = [UIColor orangeColor];
    [startBtn addTarget:self action:@selector(startBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];


}



//动画开始后，durationField不可用
-(void)setControlsEnabled:(BOOL)enabled{

    for (UIControl *control in @[durationField,repeatField,startBtn]) {
        control.enabled = enabled;
        control.alpha   = enabled?1.0f:0.25f;
    }


}



-(void)startBtn{

    //获取设置的duration和repeateCount
    CFTimeInterval dura = [durationField.text  doubleValue];
    float repeateCo = [repeatField.text floatValue];
    
    
    //设置属性动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath     = @"transform.rotation";
    animation.duration    = dura;
    animation.repeatCount = repeateCo;
    animation.byValue     = @(M_PI * 2);
    animation.delegate    = self;
    
    //应用到shipLayer
    [shipLayer addAnimation:animation forKey:@"ratationAnimation"];
    
    [self setControlsEnabled:NO];
}




#pragma UITextFieldDelegate方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [durationField resignFirstResponder];
    [repeatField resignFirstResponder];
    return YES;

}

#pragma CAAnimation

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    [self setControlsEnabled:YES];

}




//---------------------------------

- (void)swingDoor
{
    
    //创建容器图层
    containerView = [[UIView alloc]init];
    containerView.frame = CGRectMake(0, 120, kGetViewWidth(self.view), 300);
    containerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:containerView];
 
    //add the door
    CALayer *doorLayer = [CALayer layer];
    doorLayer.frame = CGRectMake(0, 0, 128, 256);
    doorLayer.position = CGPointMake(150 - 64, 150);
    doorLayer.anchorPoint = CGPointMake(0, 0.5);
    doorLayer.contents = (__bridge id)[UIImage imageNamed: @"Door.png"].CGImage;
    doorLayer.shadowColor = [UIColor lightGrayColor].CGColor;
    doorLayer.shadowOpacity = 0.5;
    [containerView.layer addSublayer:doorLayer];
    
    //apply perspective transform
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    containerView.layer.sublayerTransform = perspective;
    
    
    //apply swinging animation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI_2);
    animation.duration = 2.0;
    animation.repeatDuration = INFINITY;
    animation.autoreverses = YES;
    [doorLayer addAnimation:animation forKey:nil];
}


@end
