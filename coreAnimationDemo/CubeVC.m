//
//  CubeVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/24.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "CubeVC.h"
#import <GLKit/GLKit.h>



#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 1

@interface CubeVC ()

@property (nonatomic,strong) UIView     *containerView;
@property (nonatomic,strong) NSMutableArray *faces;


@end

@implementation CubeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //添加containnerView
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, kGetViewWidth(self.view), kGetViewWidth(self.view))];
    [self.view addSubview:self.containerView];

    self.faces = [[NSMutableArray alloc]init];
    [self creatFacesArray];
    
    
    //使用sublayerTransform给containerView的子图层的增加透视
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0/500.0;
    
    
    //只显示1面,所以旋转六面体，但必须旋转6个面；调整容器的sublayerTransform
    // 绕X轴旋转45度
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    // 绕Y轴旋转45度
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    
    //注意：上面的旋转代码加入后，在应用到layer的sublayerTransform上否则无用
    self.containerView.layer.sublayerTransform = perspective;
    
    //增加立方体面1
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 withTransform:transform];
    
    //增加立方体面2
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    
    // 增加立方体面3
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    
    // 增加立方体面4
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    
    // 增加立方体面5
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    
    // 增加立方体面6
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
   

}

-(NSArray *)creatFacesArray{

    //初始化6个view
    for (int i = 1; i <= 6 ; i ++) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        view.backgroundColor = [UIColor whiteColor];
        
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
        [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [view addSubview:btn];
        
        [self.faces addObject:view];
        
    }
  
    return self.faces;
}


-(void)addFace:(NSInteger)index withTransform:(CATransform3D)transform{

    //获取立方体的面添加进containerView上
    UIView *face = self.faces[index];
    [self.containerView addSubview:face];
    
    //在容器中居中这些面
    CGSize size = self.containerView.bounds.size;
    face.center = CGPointMake(size.width/2, size.height/2);
 
    //应用这些变换
    face.layer.transform = transform;
    
    
    [self applyLightingToFace:face.layer];

}


-(void)applyLightingToFace:(CALayer *)face{
    
    NSLog(@"applyLightingToFace");
    
    //添加光亮图层
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    
    //将face的transform转换成GLKMatrix4矩阵
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    
    //获得3×3的旋转矩阵
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    
    //获得表面向量的值
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    
    //获得与光方向的叉乘
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    
    //设置光亮图层的opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
  
}




@end
