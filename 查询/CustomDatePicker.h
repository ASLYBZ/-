//
//  CustomDatePicker.h
//  查询
//
//  Created by 王卫亮 on 16/8/26.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectDateView.h"

typedef void (^DateSelect)(NSString *selectData);

@interface CustomDatePicker : UIView

@property (strong, nonatomic) NSDate *selectDate;

- (void)didFinishSelectedDate:(DateSelect)selectData;

- (void)checkDateWithDateString:(NSString *)dateString startClick:(BOOL)isStart;

@end
