//
//  QueryView.h
//  查询
//
//  Created by 王卫亮 on 16/8/24.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchButton;

@protocol QueryViewDelegate <NSObject>

//- (void)updateHeaderViewHeight;

//- (void)showDateViewWithDateString:(NSString *)dateString startClick:(BOOL)isStart;

// 根据日期搜索
- (void)searchWithStartDate:(NSString *)startDate andEndDate:(NSString *)endDate;

// 根据编号搜索
- (void)searchWithOrderNumber:(NSString *)orderNum;

@end


@interface QueryView : UIView

@property (nonatomic, weak) id <QueryViewDelegate> queryViewDelegate;

+ (QueryView *)instanceViewWithFrame:(CGRect)frame;

@end
