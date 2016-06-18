//
//  AffineAnimationController.m
//  AnimationDome
//
//  Created by liangbai on 16/6/8.
//  Copyright © 2016年 liangbai. All rights reserved.
//
/**********************************************************************************
 *我们可以在仿射动画过程中进行基本的动画设置
 *（1）基本的转化位，通过设置开始和最后的位置坐标修改transform完成
 *（2）基本缩放动画，通过设置缩放的比例（默认大小1.0）就可以达到缩放的动画的效果
 *（3）基本旋转动画，设置旋转的角度Rotation
 *（4）组合动画只需要设置具体的transform，然后依次进行添加到下一个初始化的transform中会子自动形成组合动画
 *（5）
 **********************************************************************************
 */

#import "AffineAnimationController.h"
#import "Animation-PrefixHeader.pch"

@interface AffineAnimationController ()

@property (nonatomic, strong) UIView *moveView;

@end

@implementation AffineAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    _moveView = [[UIView alloc] initWithFrame:CGRectMake(UISCREEN_WITH/2-30, UISCREEN_HEIGHT/2-30, 60, 60)];
    _moveView.backgroundColor = [UIColor blueColor];
    _moveView.layer.masksToBounds = YES;
    _moveView.layer.cornerRadius = 8;
    [self.view addSubview:_moveView];
}

-(NSArray *)operationArrayTitle{
    return [NSArray arrayWithObjects:@"位移",@"缩放",@"旋转",@"组合",@"反转", nil];
}
-(NSString *)controllerTitle{
    return @"UIView 仿射动画";
}

-(void)click:(UIButton *)bt{
    switch (bt.tag) {
        case 0:
        {
            [self posationAnimation];
            break;
        }
        case 1:
        {
            [self scaleAnimation];
            break;
        }
        case 2:
        {
            [self rotateAnimation];
            break;
        }
        case 3:
        {
            [self groupAnimation];
            break;
        }
        case 4:
        {
            [self invertAnimation];
            break;
        }
        default:
            break;
    }
}

//位移动画
-(void)posationAnimation{
    _moveView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0 animations:^{
        CGAffineTransform transform1 =  CGAffineTransformMakeTranslation(50, 50);
        _moveView.transform =  CGAffineTransformTranslate(transform1, 50, 100);
    }];
}
//缩放动画
-(void)scaleAnimation{
    _moveView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0 animations:^{
        _moveView.transform = CGAffineTransformMakeScale(1.5, 1.5);
    }];
}
//旋转动画
-(void)rotateAnimation{
    _moveView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0 animations:^{
        _moveView.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}
//组合动画
-(void)groupAnimation{
    _moveView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0 animations:^{
        CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_PI*3);
        _moveView.transform =  CGAffineTransformScale(transform1, 2.0, 2.0);
//        _moveView.transform = CGAffineTransformTranslate(transform2, 250, 250);
    }];
}
//反转动画
-(void)invertAnimation{
    _moveView.transform = CGAffineTransformIdentity;
    //变换
    [UIView animateWithDuration:1.0 animations:^{
        _moveView.transform = CGAffineTransformInvert(CGAffineTransformMakeRotation(M_PI*3));
    }];
}

@end
