//
//  CircleViewController.m
//  AnimationDome
//
//  Created by liangbai on 16/6/18.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import "CircleViewController.h"
#import "UIColor+CustomColors.h"
#import <pop/POP.h>

@interface CircleViewController ()<POPAnimationDelegate>

@property (nonatomic, strong) UIControl *dragView;

- (void)initView;
- (void)touchDown:(UIButton *)sender;
- (void)handlePan:(UIPanGestureRecognizer *)recognizer;

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationController];
    [self initView];
}

#pragma mark -popAnimationDelegate
- (void)pop_animationDidApply:(POPDecayAnimation *)anim
{
    BOOL isDragViewOutsideOfSuperView = !CGRectContainsRect(self.view.frame, self.dragView.frame);
    if (isDragViewOutsideOfSuperView) {
        CGPoint currentVelocity = [anim.velocity CGPointValue];
        CGPoint velocity = CGPointMake(currentVelocity.x, -currentVelocity.y);
        POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        positionAnimation.toValue = [NSValue valueWithCGPoint:self.view.center];
        [self.dragView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    }
}

#pragma mark - private instance motheds
-(void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Popping Circle";
    
    UIPanGestureRecognizer *recoginizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    self.dragView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    self.dragView.center = self.view.center;
    self.dragView.backgroundColor = [UIColor customBuleColor];
    self.dragView.layer.cornerRadius = CGRectGetWidth(self.dragView.bounds)/2;
    [self.dragView addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.dragView addGestureRecognizer:recoginizer];
    
    [self.view addSubview:self.dragView];
}
/**
 *(1)获得在平滑的过程中获取位置
 *(2)根据界面的滑动重新设置view的中心位置
 *(3)判断是否平滑结束，结束就就需要设置速率
 *(4)POPDecayAnimation添加动画
 *
 */
- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if(recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [recognizer velocityInView:self.view];
        POPDecayAnimation *positionAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.delegate = self;
        positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        [recognizer.view.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
    }
}
-(void)touchDown:(UIButton *)sender{
    [sender.layer pop_removeAllAnimations];
}

-(void)initNavigationController{
    UIBarButtonItem *leftBItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    
    self.navigationItem.leftBarButtonItem = leftBItem;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
