//
//  GroupAnimationController.m
//  AnimationDome
//
//  Created by liangbai on 16/6/8.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import "GroupAnimationController.h"
#import "Animation-PrefixHeader.pch"

@interface GroupAnimationController ()

@property (nonatomic, strong) UIView *moveView;

@end

@implementation GroupAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    _moveView = [[UIView alloc] initWithFrame:CGRectMake(UISCREEN_WITH/2-30, UISCREEN_HEIGHT/2-30, 60, 60)];
    _moveView.backgroundColor = [UIColor blueColor];
    _moveView.layer.masksToBounds = YES;
    _moveView.layer.cornerRadius = 8;
    [self.view addSubview:_moveView];

}

-(NSArray *)operationArrayTitle{
    return [NSArray arrayWithObjects:@"连续",@"组合", nil];
}
-(NSString *)controllerTitle{
    return @"组合动画";
}
-(void)click:(UIButton *)bt{
    switch (bt.tag) {
        case 0:
        {
            [self continueAnimation];
            break;
        }
        case 1:
        {
            [self groupAnimation];
            break;
        }
        default:
            break;
    }
}

//组合动画
-(void)groupAnimation{
    //位移动化
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(UISCREEN_WITH/2, 115)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(UISCREEN_WITH/2, 200)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(15, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(15, UISCREEN_HEIGHT/2)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(UISCREEN_WITH/2, UISCREEN_HEIGHT/2)];
    animation.values = [NSArray arrayWithObjects:value0, value1, value2, value3, value4, nil];
    
    //缩放动画
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.fromValue = [NSNumber numberWithFloat:0.8f];
    animation1.toValue = [NSNumber numberWithFloat:2.0f];
   
    //旋转动画
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation2.toValue = [NSNumber numberWithFloat:M_PI*4];
   
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:animation, animation1, animation2 ,nil];
    group.duration = 4.0f;
    [_moveView.layer addAnimation:group forKey:@"groupAnimation"];
}

//连续动画
-(void)continueAnimation{
    CFTimeInterval courrentTime = CACurrentMediaTime();
    
    //位移动化
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(UISCREEN_WITH/2, 115)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(UISCREEN_WITH/2, 200)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(15, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(15, UISCREEN_HEIGHT/2)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(UISCREEN_WITH/2, UISCREEN_HEIGHT/2)];

    animation.values = [NSArray arrayWithObjects:value0, value1, value2, value3, value4, nil];
    animation.beginTime = courrentTime;
    animation.duration = 4.0;
    animation.removedOnCompletion = NO;
    [_moveView.layer addAnimation:animation forKey:@"key"];
    
    //旋转动画
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation2.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI*8, 0, 0, 0)];
    animation2.beginTime = courrentTime + 4.0;
    animation2.duration = 2.0;
    animation2.removedOnCompletion = NO;
    [_moveView.layer addAnimation:animation2 forKey:@"rotate"];
    
    //缩放动画
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.toValue = [NSNumber numberWithFloat:2.0f];
    animation1.duration = 2.0;
    animation1.beginTime = courrentTime + 6.0;
    animation1.removedOnCompletion = NO;
    [_moveView.layer addAnimation:animation1 forKey:@"scale"];
}

@end
