//
//  TitleButton.m
//  AnimationDome
//
//  Created by liangbai on 16/6/7.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import "TitleButton.h"

@interface TitleButton ()
- (void)setup;
@end

@implementation TitleButton


+(instancetype)button{
    return [self buttonWithType:UIButtonTypeCustom];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Instance methods
-(UIEdgeInsets)titleEdgeInsets{
    return UIEdgeInsetsMake(2.f, 3.f, 3.f, 2.f);
}

-(CGSize)intrinsicContentSize{
    CGSize s = [super intrinsicContentSize];
    
    return CGSizeMake(s.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right,
                      s.height + self.titleEdgeInsets.top + self.titleEdgeInsets.bottom);
}

-(void)setup{
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    self.backgroundColor = [UIColor grayColor];
    self.layer.cornerRadius = 5.0;
}

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString*)title{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.backgroundColor = [UIColor grayColor];
        self.layer.cornerRadius = 5.0;
    }
    return self;
}

@end
