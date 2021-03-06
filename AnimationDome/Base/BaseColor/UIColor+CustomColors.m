//
//  UIColor+CustomColors.m
//  AnimationDome
//
//  Created by liangbai on 16/6/18.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)

+ (UIColor *)customGrayColor
{
    return [self colorWithRed:84 green:84 blue:84];
}

+ (UIColor *)customRedColor
{
    return [self colorWithRed:231 green:76 blue:60];
}

+ (UIColor *)customYellowColor
{
    return [self colorWithRed:241 green:196 blue:15];
}

+ (UIColor *)customGreenColor
{
    return [self colorWithRed:46 green:204 blue:113];
}

+(UIColor *)customBuleColor{
    return [self colorWithRed:52 green:152 blue:219];
}

#pragma mark - Private class methods
+(UIColor *)colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue{
    return [UIColor colorWithRed:(float)(red/255.f)
                           green:(float)(green/255.f)
                           blue:(float)(blue/255.f)
                           alpha:1.f];
}

@end
