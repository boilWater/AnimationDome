//
//  SaiZiBaseView.m
//  AnimationDome
//
//  Created by liangbai on 16/6/13.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import "SaiZiBaseView.h"

@interface SaiZiBaseView ()

@end

@implementation SaiZiBaseView

-(instancetype)initWithFrame:(CGRect)frame paperTitle:(NSString *)title backgroundColor:(UIColor *) color{
    
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x-5, self.center.y-7, 10, 14)];
        numberLabel.text = title;
        numberLabel.font = [UIFont systemFontOfSize:16];
        numberLabel.textColor = [UIColor blueColor];
        [self addSubview:numberLabel];
    }
    self.layer.backgroundColor = color.CGColor;
    return self;
}

@end
