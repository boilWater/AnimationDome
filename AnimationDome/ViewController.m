//
//  ViewController.m
//  AnimationDome
//
//  Created by liangbai on 16/5/31.
//  Copyright © 2016年 liangbai. All rights reserved.
//
//
//   View的动画实现
//

#import "ViewController.h"
#import "Animation-PrefixHeader.pch"

@interface ViewController ()

@property (nonatomic, strong) UIView *moveView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMoveView];
    
}
-(void)initMoveView{
    _moveView = [[UIView alloc] initWithFrame:CGRectMake(UISCREEN_WITH/2 - 40, UISCREEN_HEIGHT/2-100, 80, 80)];
    [_moveView setBackgroundColor:[UIColor blueColor]];
    _moveView.layer.masksToBounds = YES;
    _moveView.layer.cornerRadius = 20;
    [self.view addSubview:_moveView];
//    NSLog(@"x:%f, y:%f", _moveView.frame.origin.x, _moveView.frame.origin.y);
}

-(NSArray *)operationArrayTitle{
    return [NSArray arrayWithObjects:@"位移",@"透明度",@"缩放",@"旋转",@"背景色", nil];
}

-(NSString *)controllerTitle{
    return @"基础动画";
}

-(void)click:(UIButton *)bt{
    switch (bt.tag) {
        case 0:
        {
            [self positionAnimation];
            break;
        }
        case 1:
        {
            [self opacityAnimation];
            break;
        }
        case 2:
        {
            [self scaleAnimation];
            break;
        }
        case 3:
        {
            [self rotateAnimation];
            break;
        }
        case 4:
        {
            [self backColorAnimation];
            break;
        }
        default:
            break;
    }
}

//位移
-(void)positionAnimation{
    //这里需要注意我们使用fromValue和toValue是以center为参照
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(UISCREEN_WITH/2, UISCREEN_HEIGHT/2-60)];
//    NSLog(@"%f, %f", UISCREEN_WITH/2 - 40,UISCREEN_HEIGHT/2-60);
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(UISCREEN_WITH/2, 0)];
    
    animation.duration = 1.0;
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [_moveView.layer addAnimation:animation forKey:@"positionAnimation"];
    
/*
    这是使用Animation的形式进行图片移动
    [UIView animateWithDuration:1.0 animations:^{
        _moveView.frame = CGRectMake(UISCREEN_WITH, UISCREEN_HEIGHT/2-50, 50, 50);
    } completion:^(BOOL finished){
        _moveView.frame = CGRectMake(UISCREEN_WITH/2 - 40, UISCREEN_HEIGHT/2-100, 80, 80);
    }];
 */
}

//透明度
-(void)opacityAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:0.1f];
    animation.toValue = [NSNumber numberWithFloat:1.0f];
    
    animation.duration = 3.2;
    [_moveView.layer addAnimation:animation forKey:@"opacityAnimation"];
}

//缩放
-(void)scaleAnimation{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = [NSNumber numberWithFloat:2.0f];
    
    animation.duration = 2.0;
    [_moveView.layer addAnimation:animation forKey:@"scaleAnimation"];
    
/*  获取bounds的路径然后使用animation进行缩放
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 160, 160)];
    
    animation.duration = 1.0;
    [_moveView.layer addAnimation:animation forKey:@"scaleAnimation"];
*/
}

//旋转
-(void)rotateAnimation{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 0.5, 0.3)];
    
    animation.duration = 2.0;
    [_moveView.layer addAnimation:animation forKey:@"rotateAnimation"];
/*
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.toValue = [NSNumber numberWithFloat:M_PI*2];
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"rotateAnimation"];
*/
/*  使用transform.rotation属性围绕着Z轴进行旋转3quan
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = [NSNumber numberWithFloat:M_PI*3];
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"rotateAnimation"];
 */

}

//背景色
-(void)backColorAnimation{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.toValue = (id)[UIColor redColor].CGColor;
    
    animation.duration = 2.0;
    [_moveView.layer addAnimation:animation forKey:@"backgroundcolor"];
}

@end
