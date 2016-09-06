//
//  WLDatePicker.m
//  查询
//
//  Created by 王卫亮 on 16/8/25.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "WLDatePicker.h"
#import "NSDate+Extention.h"

#define GetWindowsFrameWidth [UIScreen mainScreen].bounds.size.width
#define GetWindowsFrameHeight [UIScreen mainScreen].bounds.size.height

// pickerView高度
#define kPickViewHeight (GetWindowsFrameWidth > 320 ? 260 : 230)


@interface WLDatePicker ()

@property (strong, nonatomic) UIButton *bgButton;
@property (strong, nonatomic) WLSelectPickerView *pickerView;
@property (strong, nonatomic) DateSelect selectBlock;

@end

@implementation WLDatePicker




- (instancetype)init {
    
    if (self = [super initWithFrame:[[UIScreen mainScreen] bounds]]) {
        NSLog(@"初始pushDatePicker完后");
        [[[UIApplication sharedApplication] keyWindow] addSubview:self];
        //半透明背景按钮
        _bgButton = [[UIButton alloc] init];
        [self addSubview:_bgButton];
        [_bgButton addTarget:self action:@selector(dismissDatePicker) forControlEvents:UIControlEventTouchUpInside];
        _bgButton.backgroundColor = [UIColor blackColor];
        _bgButton.alpha = 0.0;
        _bgButton.frame = CGRectMake(0, 0, GetWindowsFrameWidth, GetWindowsFrameHeight);
        
        //时间选择View
        _pickerView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([WLSelectPickerView class]) owner:self options:nil].lastObject;
        [self addSubview:_pickerView];
        _pickerView.frame = CGRectMake(0, GetWindowsFrameHeight, GetWindowsFrameWidth, kPickViewHeight);
        [_pickerView.cancleBtn addTarget:self action:@selector(dismissDatePicker) forControlEvents:UIControlEventTouchUpInside];
        [_pickerView.confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_pickerView.datePicker addTarget:self action:@selector(datePickerValueChange:) forControlEvents:UIControlEventValueChanged];
        
        //DatePicker属性设置
        _selectDate = [NSDate new];
        _pickerView.datePicker.date = _selectDate;
        _pickerView.datePicker.minimumDate = _selectDate;
        _pickerView.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        
        // 最大选择时间
        [_pickerView.datePicker setMaximumDate:[NSDate date]];
        
        // 最小选择时间
        [_pickerView.datePicker setMinimumDate:[NSDate myFormatterDate:@"2008/01/01"]];
        
        // 设置 datePickerMode
        _pickerView.datePicker.datePickerMode = UIDatePickerModeDate;
        
        NSLog(@"初始pushDatePicker完后");
    }
    return self;
}


// 检查开始结束时间
- (void)checkDateWithDateString:(NSString *)dateString startClick:(BOOL)isStart {

    if (isStart) {  // 点击的开始按钮
        
        NSDate *minDDate = [NSDate myFormatterDate:@"2008/01/01"];
        NSLog(@"%@", minDDate);
        
        [_pickerView.datePicker setMinimumDate:[NSDate myFormatterDate:@"2008/01/01"]];
        
        if (dateString && ![dateString isEqualToString:@"结束"]) {  //有结束日期
            dateString = [NSString stringWithFormat:@"20%@", dateString];
            [_pickerView.datePicker setMaximumDate:[NSDate myFormatterDate:dateString]];
        }
    } else {
        
        [_pickerView.datePicker setMaximumDate:[NSDate date]];
        
        if (dateString) { // 有开始时间， 结束时间不能比开始时间小
            dateString = [NSString stringWithFormat:@"20%@", dateString];
            [_pickerView.datePicker setMinimumDate:[NSDate myFormatterDate:dateString]];
        }
    }
    [self pushDatePicker];
}



- (void)setSelectDate:(NSDate *)selectDate
{
    _selectDate = selectDate;
    if (selectDate) {
        _pickerView.datePicker.date = selectDate;
    }
}



- (void)didFinishSelectedDate:(DateSelect)selectDate {
    
    _selectBlock = selectDate;
}

//DatePicker值改变
- (void)datePickerValueChange:(id)sender {
    _selectDate = [sender date];
}

//确定
- (void)confirmBtnClick:(id)sender {
    if (_selectBlock) {
        NSString *dateStr = [self dateStringWithDate:_selectDate DateFormat:@"yy/MM/dd"];
        _selectBlock(dateStr);
    }
    [self dismissDatePicker];
}

- (NSString *)dateStringWithDate:(NSDate *)date DateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    NSString *str = [dateFormatter stringFromDate:date];
    return str ? str : @"";
}



//出现
- (void)pushDatePicker {
    NSLog(@"初始pushDatePicker完后");
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.pickerView.frame = CGRectMake(0, GetWindowsFrameHeight - kPickViewHeight, GetWindowsFrameWidth, kPickViewHeight);
        weakSelf.bgButton.alpha = 0.4;
    }];
}

//消失
- (void)dismissDatePicker {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.pickerView.frame = CGRectMake(0, GetWindowsFrameHeight, GetWindowsFrameWidth, kPickViewHeight);
        weakSelf.bgButton.alpha = 0.0;
    } completion:^(BOOL finished) {
        [weakSelf.pickerView removeFromSuperview];
        [weakSelf.bgButton removeFromSuperview];
        [weakSelf removeFromSuperview];
    }];
}


@end
