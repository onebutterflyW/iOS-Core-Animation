//
//  ViewController.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/22.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "ViewController.h"
#import "layerTVC.h"


@interface ViewController ()
{

    UIButton *btnLayer;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    btnLayer = [[UIButton alloc]initWithFrame:CGRectMake(20, 120, 100,40)];
    btnLayer.backgroundColor = [UIColor lightGrayColor];
    [btnLayer setTitle:@"layer实例" forState:UIControlStateNormal];
    [btnLayer addTarget:self action:@selector(tapBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:btnLayer];
    
  


}

-(void)tapBtn{


    layerTVC *layerV = [[layerTVC alloc]init];
    [self.navigationController pushViewController:layerV animated:NO];

}




@end
