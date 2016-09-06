//
//  WLDatePicker.h
//  查询
//
//  Created by 王卫亮 on 16/8/25.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLSelectPickerView.h"


typedef void (^DateSelect)(NSString *selectData);

@interface WLDatePicker : UIView


@property (strong, nonatomic) NSDate *maxSelectDate;
///优先级低于isBeforeTime
@property (strong, nonatomic) NSDate *minSelectDate;

@property (strong, nonatomic) NSDate *selectDate;

///是否可选择当前时间之前的时间,默认为NO
@property (nonatomic,assign) BOOL isBeforeTime;

///DatePickerMode,默认是DateAndTime
@property (assign, nonatomic) UIDatePickerMode datePickerMode;

- (void)didFinishSelectedDate:(DateSelect)selectData;

- (void)checkDateWithDateString:(NSString *)dateString startClick:(BOOL)isStart;


@end
