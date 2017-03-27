//
//  layerTVC.m
//  coreAnimationDemo
//
//  Created by 软件工程系01 on 17/3/22.
//  Copyright © 2017年 软件工程系01. All rights reserved.
//

#import "layerTVC.h"
#import "CustomDrawingVC.h"

#import "CornerRadiusVC.h"
#import "layerBorderVC.h"
#import "ShadowOpacityVC.h"
#import "shadowPathVC.h"
#import "maskVC.h"
#import "GroupOpacityVC.h"

#import "tansformVC.h"
#import "minTransformVC.h"
#import "_DDTransformVC.h"
#import "ToushiTouYingVC.h"
#import "SublayerTransformVC.h"
#import "bianPingHuaLayerVC.h"
#import "CubeVC.h"


#import "affairVC.h"
#import "layerBehaviorVC.h"
#import "presentationAndModelVC.h"

#import "CABasicAnimationVC.h"
#import "KeyframeAnimationVC.h"
#import "AnimationGroupVC.h"
#import "TransitionVC.h"
#import "CancelAnimationVC.h"


#import "PropertyOfCAMediaTimingVC.h"

@interface layerTVC ()
{
    NSMutableArray *SectionRowCount;//每个section的行数
    NSArray *sectionArr;
    NSArray *firstArr;
    NSArray *secondVisual;
    NSArray *changeTransform;//变换
    NSArray *hideAnimation;//隐式动画
    NSArray *visualAnimationArr;//显示动画
    NSArray *layerTimeArr;//图层时间
    

}
@end

@implementation layerTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    sectionArr=@[@"可视化效果",@"变化",@"变换",@"隐式动画",@"显示动画",@"图层时间"];
    
    firstArr = @[@"自定义绘制"];
    secondVisual = @[@"圆角",@"图层边框",@"阴影",@"创建阴影形状",@"图层",@"组透明"];
    changeTransform = @[@"仿射变换",@"混合变换",@"3D变换",@"透视投影",@"sublayerTransform属性",@"扁平化图层",@"立方体"];
    hideAnimation   = @[@"事务",@"图层行为",@"呈现与模型"];
    visualAnimationArr = @[@"属性动画--基础CABasicAnimation",@"属性动画--关键帧CAKeyframeAnimation",@"动画组--CAAnimationGroup",@"过渡动画--CATransition",@"动画过程中取消动画"];
    layerTimeArr = @[@"CAMediaTiming协议的一些属性"];
    
    SectionRowCount = [[NSMutableArray alloc] init];
    [SectionRowCount addObject:firstArr];
    [SectionRowCount addObject:secondVisual];
    [SectionRowCount addObject:changeTransform];
    [SectionRowCount addObject:hideAnimation];
    [SectionRowCount addObject:visualAnimationArr];
    [SectionRowCount addObject:layerTimeArr];
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [sectionArr count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        return [[SectionRowCount objectAtIndex:section]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIndentifirer = @"indentifier";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifirer];
    
    if(indexPath.section == 0){
    //tableViewCell显示的内容
       for (int j = 0; j < [firstArr count]; j ++) {
          
          if (indexPath.row == j) {
            
            NSLog(@"%@",[firstArr objectAtIndex:j]);
            cell.textLabel.text = [firstArr objectAtIndex:j];
         }
        
      }
    }
    
    
    if(indexPath.section == 1){
        //tableViewCell显示的内容
        for (int j = 0; j < [secondVisual count]; j ++) {
            
            if (indexPath.row == j) {
                
                NSLog(@"%@",[secondVisual objectAtIndex:j]);
                cell.textLabel.text = [secondVisual objectAtIndex:j];
            }
            
        }
    }
  
    
    if(indexPath.section == 2){
        //tableViewCell显示的内容
        for (int j = 0; j < [changeTransform count]; j ++) {
            
            if (indexPath.row == j) {
                
                NSLog(@"%@",[changeTransform objectAtIndex:j]);
                cell.textLabel.text = [changeTransform objectAtIndex:j];
            }
            
        }
    }
    
    
    if(indexPath.section == 3){
        //tableViewCell显示的内容
        for (int j = 0; j < [hideAnimation count]; j ++) {
            
            if (indexPath.row == j) {
                
                NSLog(@"%@",[hideAnimation objectAtIndex:j]);
                cell.textLabel.text = [hideAnimation objectAtIndex:j];
            }
            
        }
    }
    
    
    if(indexPath.section == 4){
        //tableViewCell显示的内容
        for (int j = 0; j < [visualAnimationArr count]; j ++) {
            
            if (indexPath.row == j) {
                
                NSLog(@"%@",[visualAnimationArr objectAtIndex:j]);
                cell.textLabel.text = [visualAnimationArr objectAtIndex:j];
            }
            
        }
    }

    
    if(indexPath.section == 5){
        //tableViewCell显示的内容
        for (int j = 0; j < [layerTimeArr count]; j ++) {
            
            if (indexPath.row == j) {
                
                NSLog(@"%@",[layerTimeArr objectAtIndex:j]);
                cell.textLabel.text = [layerTimeArr objectAtIndex:j];
            }
            
        }
    }

    
    return cell;
}


-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return [sectionArr objectAtIndex:section];

}




#pragma UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    if(indexPath.section == 0){
        
       if (indexPath.row == 0) {
        
          //跳转到CustomDrawingVC页面
          CustomDrawingVC *customDrawVC = [[CustomDrawingVC alloc]init];
          [self.navigationController pushViewController:customDrawVC animated:NO];
        
       }
    }
    
    if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            
            //跳转到CornerRadiusVC页面
            CornerRadiusVC *corRadVC = [[CornerRadiusVC alloc]init];
            [self.navigationController pushViewController:corRadVC animated:NO];
            
        }
        
        if (indexPath.row == 1) {
            
            //跳转到layerBorderVC页面
            layerBorderVC *layerBorVC = [[layerBorderVC alloc]init];
            [self.navigationController pushViewController:layerBorVC animated:NO];
            
        }
        
        
        if (indexPath.row == 2) {
            
            //跳转到ShadowOpacityVC页面
            ShadowOpacityVC *shadowOpaVC = [[ShadowOpacityVC alloc]init];
            [self.navigationController pushViewController:shadowOpaVC animated:NO];
            
        }
        
        if (indexPath.row == 3) {
            
            //跳转到shadowPathVC页面
            shadowPathVC *shadowPaVC = [[shadowPathVC alloc]init];
            [self.navigationController pushViewController:shadowPaVC animated:NO];
            
        }
        
        if (indexPath.row == 4) {
            
            //跳转到maskVC页面
            maskVC *maskC = [[maskVC alloc]init];
            [self.navigationController pushViewController:maskC animated:NO];
            
        }
        
        if (indexPath.row == 5) {
            
            //跳转到GroupOpacityVC页面
            GroupOpacityVC *groupVC = [[GroupOpacityVC alloc]init];
            [self.navigationController pushViewController:groupVC animated:NO];
            
        }
    }
    
    
    if (indexPath.section == 2) {
        
        if (indexPath.row == 0) {
            
            tansformVC *trnsVC = [[tansformVC alloc]init];
            [self.navigationController pushViewController:trnsVC animated:NO];
        }
        
        if (indexPath.row == 1) {
            
            minTransformVC *minVC = [[minTransformVC alloc]init];
            [self.navigationController pushViewController:minVC animated:NO];
        }
        
        if (indexPath.row == 2) {
            
            _DDTransformVC *VC= [[_DDTransformVC alloc]init];
            [self.navigationController pushViewController:VC animated:NO];
            
        }
        
        if (indexPath.row == 3) {
            
            ToushiTouYingVC *perspectiveVC= [[ToushiTouYingVC alloc]init];
            [self.navigationController pushViewController:perspectiveVC animated:NO];
            
        }
        
        if (indexPath.row == 4) {
            
            SublayerTransformVC *perspectiveVC= [[SublayerTransformVC alloc]init];
            [self.navigationController pushViewController:perspectiveVC animated:NO];
            
        }
        
        if (indexPath.row == 5) {
            
            bianPingHuaLayerVC *bianVC= [[bianPingHuaLayerVC alloc]init];
            [self.navigationController pushViewController:bianVC animated:NO];
            
        }
        
        if (indexPath.row == 6) {
            
            CubeVC *cubeVC= [[CubeVC alloc]init];
            [self.navigationController pushViewController:cubeVC animated:NO];
            
        }

        
    }
    
    
    if (indexPath.section == 3) {
        
        if (indexPath.row == 0) {
            
            affairVC *affVC = [[affairVC alloc]init];
            [self.navigationController pushViewController:affVC animated:NO];
        }
        
        if (indexPath.row == 1) {
            
            layerBehaviorVC *layerBeVC = [[layerBehaviorVC alloc]init];
            [self.navigationController pushViewController:layerBeVC animated:NO];
        }
        
        if (indexPath.row == 2) {
            
            presentationAndModelVC *presenteVC = [[presentationAndModelVC alloc]init];
            [self.navigationController pushViewController:presenteVC animated:NO];
        }

        
    }
    
    
    
    if (indexPath.section == 4) {
        
        if (indexPath.row == 0) {
            
            CABasicAnimationVC *baicVC = [[CABasicAnimationVC alloc]init];
            [self.navigationController pushViewController:baicVC animated:NO];
            
        }
        if (indexPath.row == 1) {
            
            KeyframeAnimationVC *keyframeVC = [[KeyframeAnimationVC alloc]init];
            [self.navigationController pushViewController:keyframeVC animated:NO];
            
        }
        if (indexPath.row == 2) {
            
            AnimationGroupVC *groupVC = [[AnimationGroupVC alloc]init];
            [self.navigationController pushViewController:groupVC animated:NO];
            
        }
        if (indexPath.row == 3) {
            
            TransitionVC *tranVC = [[TransitionVC alloc]init];
            [self.navigationController pushViewController:tranVC animated:NO];
            
        }
        
        if (indexPath.row == 4) {
            
            CancelAnimationVC *cancelVC = [[CancelAnimationVC alloc]init];
            [self.navigationController pushViewController:cancelVC animated:NO];
            
        }



    }
    
    
    if (indexPath.section == 5) {
        
        if (indexPath.row == 0) {
            
            PropertyOfCAMediaTimingVC *propertyVC = [[PropertyOfCAMediaTimingVC alloc]init];
            [self.navigationController pushViewController:propertyVC animated:NO];
            
        }
    }
    

}

@end
