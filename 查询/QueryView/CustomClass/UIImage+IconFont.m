//
//  UIImage+IconFont.m
//  查询
//
//  Created by 王卫亮 on 16/8/26.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "UIImage+IconFont.h"


@implementation UIImage (IconFont)


+ (UIImage *)imageWithIcon:(NSString *)iconCode inFont:(NSString *)fontName size:(NSUInteger)size color:(UIColor *)color {
    CGSize imageSize = CGSizeMake(size, size);
    // opaque：NO 不透明
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [[UIScreen mainScreen] scale]);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size, size)];
    label.font = [UIFont fontWithName:fontName size:size];
    label.text = iconCode;
    if(color){
        label.textColor = color;
    }
    [label setNumberOfLines:0];
    label.textAlignment = NSTextAlignmentCenter;
    // 渲染自身
    [label.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *retImage = [UIGraphicsGetImageFromCurrentImageContext() imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIGraphicsEndImageContext();
    return retImage;
}


+ (UIImage *)imageWithIcon:(NSString *)iconCode size:(NSUInteger)size color:(UIColor *)color {
    CGSize imageSize = CGSizeMake(size, size);
    // opaque：NO 不透明
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [[UIScreen mainScreen] scale]);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size, size)];
    label.font = [UIFont fontWithName:@"GWH_search" size:size];
    label.text = iconCode;
    if(color){
        label.textColor = color;
    }
    [label setNumberOfLines:0];
    label.textAlignment = NSTextAlignmentCenter;
    // 渲染自身
    [label.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *retImage = [UIGraphicsGetImageFromCurrentImageContext() imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIGraphicsEndImageContext();
    return retImage;
}



@end
