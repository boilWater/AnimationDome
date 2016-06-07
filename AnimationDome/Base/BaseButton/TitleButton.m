//
//  TitleButton.m
//  AnimationDome
//
//  Created by liangbai on 16/6/7.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import "TitleButton.h"

@implementation TitleButton

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString*)title{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.backgroundColor = [UIColor darkGrayColor];
    }
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 6;
    return self;
}

@end
