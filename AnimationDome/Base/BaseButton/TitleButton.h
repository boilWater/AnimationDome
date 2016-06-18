//
//  TitleButton.h
//  AnimationDome
//
//  Created by liangbai on 16/6/7.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleButton : UIButton

//可以通过此方式直接初始话UIButon
+(instancetype)button;

//需要使用初始化对UIButton进行初始确定位置
-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString*)title;

@end
