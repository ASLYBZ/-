//
//  SelectDateView.m
//  查询
//
//  Created by 王卫亮 on 16/8/26.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "SelectDateView.h"
#import "NSDate+Extention.h"


@implementation SelectDateView


- (void)awakeFromNib {
    NSLog(@"awakeFromNib");
    
    self.datePicker.date = [NSDate date];

    // 最大选择时间
    [_datePicker setMaximumDate: self.datePicker.date];
    
    // 最小选择时间
    [_datePicker setMinimumDate:[NSDate myFormatterDate:@"2008/01/01"]];
    
    // 设置 datePickerMode
    _datePicker.datePickerMode = UIDatePickerModeDate;
}


@end
