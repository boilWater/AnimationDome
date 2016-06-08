//
//  FadeAnimationController.m
//  AnimationDome
//
//  Created by liangbai on 16/6/8.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import "FadeAnimationController.h"
#import "Animation-PrefixHeader.pch"

@interface FadeAnimationController ()

@property (nonatomic, strong) UIView *moveView;
@property (nonatomic, strong) UILabel *showLabel;

@property (assign) NSInteger position;

@end

@implementation FadeAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _position = 0;
    NSInteger heigth = UISCREEN_HEIGHT/10;
    NSInteger width = UISCREEN_WITH/7;
    _moveView = [[UIView alloc] initWithFrame:CGRectMake(width*2, heigth*2, width*3, heigth*4)];
    _moveView.layer.cornerRadius = 4;
    _moveView.layer.masksToBounds = YES;
    [self.view addSubview:_moveView];
    
    _showLabel = [[UILabel alloc] initWithFrame:CGRectMake(_moveView.center.x - 20, _moveView.center.y - 10, 40, 20)];
    _showLabel.textAlignment = NSTextAlignmentCenter;
    _showLabel.textColor = [UIColor blackColor];
    _showLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_showLabel];
    
    [self change:YES];
}

-(NSArray *)operationArrayTitle{
    return [NSArray arrayWithObjects:@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFlip",@"ripple",@"Curl",@"UnCurl",@"caOpen",@"caClose", nil];
}

-(NSString *)controllerTitle{
    return @"过渡 Animation";
}
-(void)click:(UIButton *)bt{
    switch (bt.tag) {
        case 0:
        {
            [self fadeAnimation];
            break;
        }
        case 1:
        {
            [self moveInAnimation];
            break;
        }
        case 2:
        {
            [self pushAnimation];
            break;
        }
        case 3:
        {
            [self revealAnimation];
            break;
        }
        case 4:
        {
            [self cubeAnimation];
            break;
        }
        case 5:
        {
            [self suckAnimation];
            break;
        }
        case 6:
        {
            [self oglFlipAnimation];
            break;
        }
        case 7:
        {
            [self rippleAnimation];
            break;
        }
        case 8:
        {
            [self CurlAnimation];
            break;
        }
        case 9:
        {
            [self UnCurlAnimation];
            break;
        }
        case 10:
        {
            [self caOpenAnimation];
            break;
        }
        case 11:
        {
            [self caCloseAnimation];
            break;
        }
        default:
            break;
    }
}
//**********************************public api***********************/
/*
 type:
 kCATransitionFade;
 kCATransitionMoveIn;
 kCATransitionPush;
 kCATransitionReveal;
 */
/*
 subType:
 kCATransitionFromRight;
 kCATransitionFromLeft;
 kCATransitionFromTop;
 kCATransitionFromBottom;
 */

//消失进入动画
-(void)fadeAnimation{
    [self change:YES];
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromRight;
    
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"fadeAnimation"];
}

//移动进行动画
-(void)moveInAnimation{
    [self change:YES];
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionMoveIn;
    animation.subtype = kCATransitionFromLeft;
    
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"moveInAnimation"];
}

//push的动画
-(void)pushAnimation{
    [self change:YES];
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromBottom;
    
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"pushAnimation"];
}

//从上面抽层的方式进入界面
-(void)revealAnimation{
    [self change:YES];
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionReveal;
    animation.subtype = kCATransitionFromTop;
    
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"revealAnimation"];
}

//*************************************private API****************************/
//@"cube",@"suck",@"oglFlip",@"ripple",@"Curl",@"UnCurl",@"caOpen",@"caClose"
-(void)cubeAnimation{
    [self change:YES];
    CATransition *animation = [CATransition animation];
    animation.type = @"cube";//动画类型
    animation.subtype = kCATransitionFromTop;
    
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"cubeAnimation"];

}
-(void)suckAnimation{
    [self change:YES];
    CATransition *animation = [CATransition animation];
    animation.type = @"suckEffect";//动画类型
    animation.subtype = kCATransitionFromTop;
    
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"suckAnimation"];

}
-(void)oglFlipAnimation{
    [self change:YES];
    CATransition *animation = [CATransition animation];
    animation.type = @"oglFlip";//动画类型
    animation.subtype = kCATransitionFromBottom;
    
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"oglFlipAnimation"];
}
-(void)rippleAnimation{
    [self change:YES];
    CATransition *animation = [CATransition animation];
    animation.type = @"rippleEffect";//动画类型
    animation.subtype = kCATransitionFromLeft;
    
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"rippleAnimation"];
}
-(void)CurlAnimation{
    [self change:YES];
    CATransition *animation = [CATransition animation];
    animation.type = @"pageCurl";//动画类型
    animation.subtype = kCATransitionFromRight;
    
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"CurlAnimation"];
}
-(void)UnCurlAnimation{
    [self change:YES];
    CATransition *animation = [CATransition animation];
    animation.type = @"pageUnCurl";//动画类型
    animation.subtype = kCATransitionFromLeft;
    
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"UnCurlAnimation"];
}
-(void)caOpenAnimation{
   
    [self change:YES];
    CATransition *animation = [CATransition animation];
    animation.type = @"cameraIrisHollowOpen";//动画类型
    animation.subtype = kCATransitionFromBottom;
    
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"caOpenAnimation"];
}
-(void)caCloseAnimation{
 
    [self change:YES];
    CATransition *animation = [CATransition animation];
    animation.type = @"cameraIrisHollowClose";//动画类型
    animation.subtype = kCATransitionFromBottom;
    
    animation.duration = 2.0;
    
    [_moveView.layer addAnimation:animation forKey:@"caCloseAnimation"];
}

//改变显示图像的背景和数字
-(void)change:(BOOL) isChanged{
    if (self.position > 4) {
        _position = 0;
    }
    if (self.position < 0) {
        _position = 4;
    }
    NSArray *colorArray = [NSArray arrayWithObjects:[UIColor blueColor],[UIColor grayColor],[UIColor greenColor],[UIColor orangeColor],[UIColor yellowColor], nil];
    NSArray *numberArray = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    
    _moveView.backgroundColor = colorArray[_position];
    _showLabel.text = numberArray[_position];
    
    if (isChanged) {
        _position++;
    }else{
        _position--;
    }
}

@end
