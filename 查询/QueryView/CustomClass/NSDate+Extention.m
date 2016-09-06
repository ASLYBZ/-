//
//  NSDate+Extention.m
//  查询
//
//  Created by 王卫亮 on 16/8/24.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "NSDate+Extention.h"

@implementation NSDate (Extention)


// 根据日期字符串   返回格式化日期
+ (NSDate *)myFormatterDate:(NSString *)dateStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    NSDate *inputDate = [dateFormatter dateFromString:dateStr];
    return inputDate;
}


//
+ (NSString *)myDateToString:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:@"yyyy/MM/dd"];

    return [dateFormatter stringFromDate:date];
}






@end
