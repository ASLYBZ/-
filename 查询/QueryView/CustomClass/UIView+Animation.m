//
//  UIView+Animation.m
//  查询
//
//  Created by 王卫亮 on 16/8/25.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)



- (void)transitionWithType:(NSString *)type WithSubtype:(NSString *)subtype AndDuration:(int)duration ForView:(UIView *)view{
    CATransition *animation = [CATransition animation];
    animation.duration = duration;
    animation.type = type;
    if (subtype != nil) {
        animation.subtype = subtype;
    }
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [view.layer addAnimation:animation forKey:@"animation"];
}


- (void)transitionWithDuration:(int)duration ForView:(UIView *)view{
    CATransition *animation = [CATransition animation];
    animation.duration = duration;
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromLeft;
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [view.layer addAnimation:animation forKey:@"animation"];
}



@end
