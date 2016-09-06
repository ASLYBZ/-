//
//  UIButton+IconFont.h
//  Supplier
//
//  Created by 王卫亮 on 16/8/26.
//  Copyright © 2016年 romwe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (IconFont)

- (void)mySetTitle:(NSString *)title andFontName:(NSString *)fontName andSize:(NSInteger)size;

- (void)setTitleWithIcon:(NSString *)iconCode size:(NSInteger)size color:(UIColor *)color;

@end
