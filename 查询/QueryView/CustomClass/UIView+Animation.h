//
//  UIView+Animation.h
//  查询
//
//  Created by 王卫亮 on 16/8/25.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)

- (void)transitionWithType:(NSString *)type WithSubtype:(NSString *)subtype AndDuration:(int)duration ForView:(UIView *)view;

- (void)transitionWithDuration:(int)duration ForView:(UIView *)view;

- (void)cameraTransitionWithDuration:(int)duration ForView:(UIView *)view;

@end
