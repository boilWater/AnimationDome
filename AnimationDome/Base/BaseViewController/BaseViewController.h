//
//  BaseViewController.h
//  AnimationDome
//
//  Created by liangbai on 16/6/7.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 *返回Controller的标题
 *
 */
-(NSString *)controllerTitle;

/**
 *对按钮进行点击时的监听
 *
 */
-(void)click :(UIButton*)bt;

/**
 *初始化View，我们可以通过来实现button的显示
 *
 */
-(void)initView;

/**
 *实现对于按钮title的事实上实现
 *
 */
-(NSArray *)operationArrayTitle;


@end
