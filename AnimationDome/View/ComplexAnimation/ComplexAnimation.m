//
//  ComplexAnimation.m
//  AnimationDome
//
//  Created by liangbai on 16/6/13.
//  Copyright © 2016年 liangbai. All rights reserved.
//
//  没有实现关于相机显示过程一起转动的效果，需要进行相关的修改
//
//


#import "ComplexAnimation.h"
#import "SaiZiBaseView.h"
#import "Animation-PrefixHeader.pch"
#import <QuartzCore/QuartzCore.h>
#import <GLKit/GLKit.h>

@interface ComplexAnimation ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic) CATransform3D perspective;
@property (nonatomic, strong) SaiZiBaseView *paperView;

@end

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5

@implementation ComplexAnimation

-(void)viewDidLoad{
    [super viewDidLoad];
    [self initBaseView];
    
}

-(void)initBaseView{
    self.view.backgroundColor = [UIColor lightGrayColor];
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(UISCREEN_WITH/2 - 50, UISCREEN_HEIGHT/4, 100, 100)];
    [self.view addSubview:_contentView];
    
    _perspective = CATransform3DIdentity;
    _perspective.m34 = -1.0 / 500;
    
    _perspective = CATransform3DRotate(_perspective, -M_PI_4, 1, 0, 0);
    _perspective = CATransform3DRotate(_perspective, -M_PI_4, 0, 1, 0);
    
    self.contentView.layer.sublayerTransform = _perspective;
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 50);
    
    [self addPapaerView:@"1" withTransform:transform backgroundColor:[UIColor whiteColor]];
    //add cube face 2
    transform = CATransform3DMakeTranslation(50, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addPapaerView:@"2" withTransform:transform backgroundColor:[UIColor cyanColor]];
    //add cube face 3
    transform = CATransform3DMakeTranslation(0, -50, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addPapaerView:@"3" withTransform:transform backgroundColor:[UIColor brownColor]];
    //add cube face 4
    transform = CATransform3DMakeTranslation(0, 50, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addPapaerView:@"4" withTransform:transform backgroundColor:[UIColor grayColor]];
    //add cube face 5
    transform = CATransform3DMakeTranslation(-50, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addPapaerView:@"5" withTransform:transform backgroundColor:[UIColor lightGrayColor]];
    //add cube face 6
    transform = CATransform3DMakeTranslation(0, 0, -50);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addPapaerView:@"6" withTransform:transform backgroundColor:[UIColor yellowColor]];
}


#pragma 初始化每个界面并且给界面设置偏转值
-(void)addPapaerView:(NSString *)paperTitle withTransform:(CATransform3D)transform backgroundColor:(UIColor *)color{
    
    CGSize contionerView = self.contentView.bounds.size;
    _paperView = [[SaiZiBaseView alloc] initWithFrame:CGRectMake(0, 0, contionerView.width, contionerView.height) paperTitle:paperTitle backgroundColor:(UIColor *) color];
    
    _paperView.layer.transform = transform;
    [self.contentView addSubview:_paperView];
}

-(NSString *)controllerTitle{
    return @"复杂 Animation";
}
-(NSArray *)operationArrayTitle{
    return [NSArray arrayWithObjects:@"色子旋转",@"3D", nil];
}

-(void)click:(UIButton *)bt{
    switch (bt.tag) {
        case 0:
        {
            
            break;
        }
        case 1:
        {
            
            break;
        }
        default:
            break;
    }
}

@end
