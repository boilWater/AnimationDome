//
//  BaseViewController.h
//  AnimationDome
//
//  Created by liangbai on 16/6/7.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

-(NSString *)controllerTitle;


-(void)click :(UIButton*)bt;


-(void)initView;


-(NSArray *)operationArrayTitle;


@end
