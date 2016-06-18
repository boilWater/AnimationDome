//
//  UIImage+ConnerRadousUIImage.m
//  AnimationDome
//
//  Created by liangbai on 16/6/12.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import "UIImage+ConnerRadousUIImage.h"

@implementation UIImage (ConnerRadousUIImage)

-(UIImage *)connerRadoiusUIImage:(CGSize)sizeToFit andCornerRadious:(CGFloat)radious{
    
    //设置图片处理的大小范围
    CGRect rect = (CGRect){0.f, 0.f, sizeToFit};
    
//    Creates a bitmap-based graphics context with the specified options.创建基本位图
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, UIScreen.mainScreen.scale);
//    Adds a previously created Quartz path object to the current path in a graphics context.添加位图截取的路径
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radious].CGPath);
//    Modifies the current clipping path, using the nonzero winding number rule.截图图片
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    
    UIImage *currentImage =  UIGraphicsGetImageFromCurrentImageContext();
    
//    Removes the current bitmap-based graphics context from the top of the stack.
    UIGraphicsEndImageContext();
    
    return currentImage;
}

@end
