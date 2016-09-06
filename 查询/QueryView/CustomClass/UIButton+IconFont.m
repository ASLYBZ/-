//
//  UIButton+IconFont.m
//  Supplier
//
//  Created by 王卫亮 on 16/8/26.
//  Copyright © 2016年 romwe. All rights reserved.
//

#import "UIButton+IconFont.h"

@implementation UIButton (IconFont)

- (void)mySetTitle:(NSString *)title andFontName:(NSString *)fontName andSize:(NSInteger)size {
    [self setTitle:title forState:UIControlStateNormal];
    if (fontName) {
        self.titleLabel.font = [UIFont fontWithName:fontName size:size];
    } else {
        self.titleLabel.font = [UIFont fontWithName:@"GWH_search" size:size];
    }
    
}




- (void)setTitleWithIcon:(NSString *)iconCode size:(NSInteger)size color:(UIColor *)color {
    [self setTitle:iconCode forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"GWH_search" size:size];
    if (color) {
        [self setTitleColor:color forState:UIControlStateNormal];
    }
}



@end
