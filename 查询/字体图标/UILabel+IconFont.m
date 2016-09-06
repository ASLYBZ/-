//
//  UILabel+IconFont.m
//  查询
//
//  Created by 王卫亮 on 16/8/29.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "UILabel+IconFont.h"

@implementation UILabel (IconFont)

- (void)fontWithIcon:(NSString *)iconCode size:(NSInteger)size color:(UIColor *)color {
    self.font = [UIFont fontWithName:@"GWH_search" size:size];
    self.text = iconCode;
    if (color) {
        self.textColor = color;
    }
}


- (void)fontWithIcon:(NSString *)iconCode fontName:(NSString *)fontName size:(NSInteger)size color:(UIColor *)color {
    self.font = [UIFont fontWithName:fontName size:size];
    self.text = iconCode;
    if (color) {
        self.textColor = color;
    }
}

@end
