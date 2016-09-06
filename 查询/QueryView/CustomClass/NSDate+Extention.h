//
//  NSDate+Extention.h
//  查询
//
//  Created by 王卫亮 on 16/8/24.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extention)

+ (NSDate *)myFormatterDate:(NSString *)dateStr;

+ (NSString *)myDateToString:(NSDate *)date;

@end
