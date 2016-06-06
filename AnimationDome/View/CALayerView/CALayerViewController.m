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

@interface CALayerViewController ()

@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationCotroller];
    [self initView];
    
}
-(void)initView{
    self.title = @"CALayer Animation";
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
-(void)initNavigationCotroller{
    UIBarButtonItem *leftBItem = [[UIBarButtonItem alloc] initWithTitle:@"doBack" style:UIBarButtonItemStylePlain target:self action:@selector(doBack)];
    
    self.navigationItem.leftBarButtonItem = leftBItem;
}


-(void)doBack{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
