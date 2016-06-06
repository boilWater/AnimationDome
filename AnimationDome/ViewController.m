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
    [self initNavigationCotroller];
    [self initView];
    
}
-(void)initNavigationCotroller{
    UIBarButtonItem *leftBItem = [[UIBarButtonItem alloc] initWithTitle:@"doBack" style:UIBarButtonItemStylePlain target:self action:@selector(doBack)];
    
    self.navigationItem.leftBarButtonItem = leftBItem;
}
-(void)initView{
    self.title = @"View Animation";
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)doBack{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
