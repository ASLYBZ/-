//
//  UILabel+IconFont.h
//  查询
//
//  Created by 王卫亮 on 16/8/29.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (IconFont)

- (void)fontWithIcon:(NSString *)iconCode size:(NSInteger)size color:(UIColor *)color;

- (void)fontWithIcon:(NSString *)iconCode fontName:(NSString *)fontName size:(NSInteger)size color:(UIColor *)color;

@end
