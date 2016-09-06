//
//  QueryView.m
//  查询
//
//  Created by 王卫亮 on 16/8/24.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "QueryView.h"
#import "SearchButton.h"
#import "NSDate+Extention.h"
#import "WLDatePicker.h"
#import "UIView+Animation.h"
#import "Masonry.h"

#define GetWindowsFrameWidth [UIScreen mainScreen].bounds.size.width
#define GetWindowsFrameHeight [UIScreen mainScreen].bounds.size.height

#define kDuration 0.2

@interface QueryView ()<UITextFieldDelegate>

// 搜索按钮，选择搜索方式
//@property (weak, nonatomic) IBOutlet SearchButton *searchButton;

// 搜索页面，搜索条件和蒙版
@property (weak, nonatomic) IBOutlet UIView *bottomView;

// 搜索View
@property (weak, nonatomic) IBOutlet UIView *searchV;

// 日期View
@property (weak, nonatomic) IBOutlet UIView *dateV;

// 编号View
@property (weak, nonatomic) IBOutlet UIView *numberV;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineHeight;


// 编号TextField
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;

// DatePicker
@property (strong, nonatomic) WLDatePicker *selectDatePicker;

// 开始日期
@property (weak, nonatomic) IBOutlet SearchButton *startDate;

// 结束日期
@property (weak, nonatomic) IBOutlet SearchButton *endDate;
@property (weak, nonatomic) IBOutlet UIButton *orderBtn;
@property (weak, nonatomic) IBOutlet UIButton *dateBtn;
@property (weak, nonatomic) IBOutlet UIButton *coverBtn;
@property (weak, nonatomic) IBOutlet SearchButton *searchBtn;

@end

@implementation QueryView


- (void)awakeFromNib {
    

    
    
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"QueryView" owner:self options:nil];
    QueryView *addView = [nibView lastObject];
    [self addSubview:addView];
    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.leading.equalTo(self.mas_leading);
        make.right.equalTo(self.mas_right);
//        make.bottom.equalTo(self.mas_bottom);
        CGFloat y = GetWindowsFrameHeight - self.frame.origin.y;
        make.height.equalTo(@(y));
    }];
    
    
    
    _lineHeight.constant = 0.5; 
    _numberTextField.delegate = self;
    _numberTextField.rightViewMode = UITextFieldViewModeUnlessEditing;
    _numberTextField.layer.borderColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1].CGColor;
    _numberTextField.layer.borderWidth = 1.0;
    
    UIImageView *rightV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 4, 27, 17)];
    rightV.image = [UIImage imageNamed:@"searchImage"];
    rightV.contentMode = UIViewContentModeCenter;
    _numberTextField.rightView = rightV;
    
    UILabel *speaceLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _numberTextField.leftViewMode = UITextFieldViewModeAlways;
    _numberTextField.leftView = speaceLable;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_numberTextField resignFirstResponder];
    if (_numberTextField.text.length > 0) {
        // 根据编号搜索
        [self.queryViewDelegate searchWithOrderNumber:_numberTextField.text];
        self.numberTextField.text = @"";
        
        return YES;
    }
    //提示请输入编号
    return NO;
}


#pragma mark - dateV
// 选择开始日期
- (IBAction)chooseStartDate:(id)sender {
    _selectDatePicker = [[WLDatePicker alloc] init];
    [_selectDatePicker checkDateWithDateString:self.endDate.titleLabel.text startClick:YES];
    
    __weak typeof(self) weakSelf = self;
    [_selectDatePicker didFinishSelectedDate:^(NSString *selectedDate) {
        [weakSelf.startDate setTitle:selectedDate forState:UIControlStateNormal];
    }];
}

// 选择结束日期
- (IBAction)chooseEndDate:(id)sender {
    _selectDatePicker = [[WLDatePicker alloc] init];
    [_selectDatePicker checkDateWithDateString:self.startDate.titleLabel.text startClick:NO];
    
    __weak typeof(self) weakSelf = self;
    [_selectDatePicker didFinishSelectedDate:^(NSString *selectedDate) {
        [weakSelf.endDate setTitle:selectedDate forState:UIControlStateNormal];
    }];
}

// 日期选择完成 搜索
- (IBAction)baginSearch:(id)sender {
    
    NSString *startTimerStr = [self timeStringToTimestamp:[NSString stringWithFormat:@"20%@", self.startDate.titleLabel.text]];
    NSString *endTimerStr = @"";
    if ([self.endDate.titleLabel.text isEqualToString:@"结束"]) {  // 没有结束日期，设置结束日期为 今天
        endTimerStr = [self timeStringToTimestamp:[NSDate myDateToString:[NSDate date]]];
    } else {
        endTimerStr = [self timeStringToTimestamp:[NSString stringWithFormat:@"20%@", self.endDate.titleLabel.text]];
    }
    
    [self.queryViewDelegate searchWithStartDate:startTimerStr andEndDate:endTimerStr];
}


// 转为date
- (NSString *)timeStringToTimestamp:(NSString*)timerString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY/MM/dd"];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate *t = [formatter dateFromString:timerString];
    NSTimeInterval stamp = [t timeIntervalSince1970] ;
    
    return [[NSString stringWithFormat:@"%f",stamp]componentsSeparatedByString:@"."][0];
}


// 选择搜索方式
- (IBAction)search:(UIButton *)sender {
    self.bottomView.hidden = NO;
    [self transitionWithDuration:kDuration ForView:self];
}


// 日期搜索
- (IBAction)dateSearch:(UIButton *)sender {
    self.bottomView.hidden = YES;
    self.searchV.hidden = YES;
    self.dateV.hidden = NO;
    [self transitionWithType:kCATransitionPush WithSubtype:kCATransitionFromRight AndDuration:kDuration ForView:self];
}



// 编号搜索
- (IBAction)numberSearch:(UIButton *)sender {
    self.bottomView.hidden = YES;
    self.searchV.hidden = YES;
    self.numberV.hidden = NO;
    [self transitionWithType:kCATransitionPush WithSubtype:kCATransitionFromRight AndDuration:kDuration ForView:self];
}


// 隐藏 BottomView
- (IBAction)hiddenBottomView:(id)sender {
    self.bottomView.hidden = YES;
    [self transitionWithDuration:kDuration ForView:self];
    
    
}


// 重选
- (IBAction)resartChoose:(id)sender {
    [_numberTextField resignFirstResponder];
    self.searchV.hidden = NO;
    self.dateV.hidden = YES;
    self.numberV.hidden = YES;
    [self transitionWithType:kCATransitionPush WithSubtype:kCATransitionFromLeft AndDuration:kDuration ForView:self];
}


+ (QueryView *)instanceViewWithFrame:(CGRect)frame {
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"QueryView" owner:nil options:nil];
    QueryView *queryView = [nibView objectAtIndex:0];
    queryView.frame = frame;
    return queryView;
}




-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    
    if (hitView == nil) {
        if (!self.bottomView.isUserInteractionEnabled || self.bottomView.isHidden || self.bottomView.alpha <= 0.01) {
            return nil;
        }
        if (point.y > _orderBtn.frame.origin.y + 50 && point.y < _orderBtn.frame.origin.y + 90) {
            return _orderBtn;
        } else if (point.y > _orderBtn.frame.origin.y + 90 && point.y < _orderBtn.frame.origin.y + 130) {
            return _dateBtn;
        } else if (point.y > _orderBtn.frame.origin.y + 130) {
            return _coverBtn;
        }
    }
    return hitView;
}


- (void)dealloc {
    
}


@end
