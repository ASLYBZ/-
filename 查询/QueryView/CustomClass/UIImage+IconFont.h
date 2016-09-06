//
//  UIImage+IconFont.h
//  查询
//
//  Created by 王卫亮 on 16/8/26.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IconFont)

+ (UIImage *)imageWithIcon:(NSString *)iconCode inFont:(NSString *)fontName size:(NSUInteger)size color:(UIColor *)color;


+ (UIImage *)imageWithIcon:(NSString *)iconCode size:(NSUInteger)size color:(UIColor *)color;

@end
