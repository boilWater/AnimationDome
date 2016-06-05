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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

-(void)initView{
    self.title = @"View Animation";
    [self.view setBackgroundColor:[UIColor whiteColor]];
}


@end
