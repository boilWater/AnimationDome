//
//  CALayerViewController.m
//  AnimationDome
//
//  Created by liangbai on 16/6/2.
//  Copyright © 2016年 liangbai. All rights reserved.
//
//
//    CALayer的动画实现
//


#import "CALayerViewController.h"
#import "Animation-PrefixHeader.pch"

@interface CALayerViewController ()

@property (nonatomic, strong) UIView *moveView;

@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _moveView = [[UIView alloc] initWithFrame:CGRectMake(UISCREEN_WITH/2 - 15, 100, 30, 30)];
    _moveView.backgroundColor = [UIColor blueColor];
    _moveView.layer.masksToBounds = YES;
    _moveView.layer.cornerRadius = 8;
    [self.view addSubview:_moveView];
    
}
-(NSArray *)operationArrayTitle{
    return [NSArray arrayWithObjects:@"关键帧",@"路径",@"抖动", nil];
}

-(NSString *)controllerTitle{
    return @"帧动画";
}

-(void)click:(UIButton *)bt{
    switch (bt.tag) {
        case 0:
        {
            [self keyFrameAnimation];
            break;
        }
        case 1:
        {
            [self pathFrameAnimation];
            break;
        }
        case 2:
        {
            [self shakeFrameAnimation];
            break;
        }
        default:
            break;
    }
}

//关键帧动画的实现
-(void)keyFrameAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(UISCREEN_WITH/2, 115)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(UISCREEN_WITH/2, 200)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(15, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(15, UISCREEN_HEIGHT - 400)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(UISCREEN_WITH - 15, UISCREEN_HEIGHT - 400)];
    
    animation.values = [NSArray arrayWithObjects:value0, value1, value2, value3, value4, nil];
    animation.duration = 4.0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
     NSLog(@"%f, %f", _moveView.frame.origin.x, _moveView.frame.origin.y);
    
    animation.delegate = self;
    [_moveView.layer addAnimation:animation forKey:@"keyFrameAnimation"];
}
-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"动画开始");
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"动画结束");
}

//pathFrame动画实现
-(void)pathFrameAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(UISCREEN_WITH/5, UISCREEN_HEIGHT/5, 200, 200)];
    
    animation.path = path.CGPath;
    animation.duration = 4.0;
    animation.delegate = self;
    [_moveView.layer addAnimation:animation forKey:@"pathFrameAnimation"];
}

//sharkFrame动画显示
-(void)shakeFrameAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value0 = [NSNumber numberWithFloat:+M_PI/360*15];
    NSValue *value1 = [NSNumber numberWithFloat:M_PI/360*15];
    NSValue *value2 = [NSNumber numberWithFloat:-M_PI/360*25];
    
    animation.values = [NSArray arrayWithObjects:value0, value1, value2, nil];
    animation.repeatCount = 10;
    
    [_moveView.layer addAnimation:animation forKey:@"shakeFrameAnimation"];
}

@end
