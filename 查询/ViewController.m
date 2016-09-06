//
//  ViewController.m
//  查询
//
//  Created by 王卫亮 on 16/8/24.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "ViewController.h"
#import "QueryView.h"

#define GetWindowsFrameWidth [UIScreen mainScreen].bounds.size.width
#define GetWindowsFrameHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<QueryViewDelegate>

@property (nonatomic, strong) QueryView *queryView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 查询 View
//    _queryView = [QueryView instanceViewWithFrame:CGRectMake(0, 100, GetWindowsFrameWidth, GetWindowsFrameHeight - 100)];
//    _queryView.queryViewDelegate = self;
//    [self.view addSubview:_queryView];
}


#pragma mark - delegate
// 根据日期 搜索
- (void)searchWithStartDate:(NSString *)startDate andEndDate:(NSString *)endDate {
    NSLog(@"开始日期--->%@  结束日期--->%@", startDate, endDate);
}

// 根据订单编号搜索
- (void)searchWithOrderNumber:(NSString *)orderNum {
    NSLog(@"订单编号----->%@", orderNum);
}



- (void)dealloc {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
