//
//  TestViewController.m
//  查询
//
//  Created by 王卫亮 on 16/8/25.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "TestViewController.h"
#import "CustomDatePicker.h"

#import "UIImage+IconFont.h"
#import "UIButton+IconFont.h"
#import "UILabel+IconFont.h"

#import "SearchButton.h"


#define kImageFont(iconCode, fontSize, fontColor) [UIImage imageWithIcon:iconCode size:fontSize color:fontColor]

@interface TestViewController ()

// DatePicker
@property (strong, nonatomic) CustomDatePicker *selectDatePicker;

@property (weak, nonatomic) IBOutlet UILabel *textLabel;


@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    [_textLabel fontWithIcon:@"\U0000e610" fontName:@"iconfont" size:20 color:[UIColor redColor]];


    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 15, 15)];
    [imgV setImage:kImageFont(@"\U0000e900", 14, [UIColor greenColor])];
    [self.view addSubview:imgV];


    UIButton *iconBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 30, 30)];
    [iconBtn setTitleWithIcon:@"\U0000e900" size:14 color:[UIColor magentaColor]];
    [self.view addSubview:iconBtn];
    
    
    UIButton *imgBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 30, 30)];
    [imgBtn setTitleWithIcon:@"\U0000e900" size:14 color:[UIColor darkGrayColor]];
    
    [imgBtn setImage:[UIImage imageWithIcon:@"\U0000e900" size:14 color:[UIColor lightGrayColor]] forState:UIControlStateNormal];
    
    [self.view addSubview:imgBtn];
    
    
    SearchButton *searchBtn = [[SearchButton alloc] initWithFrame:CGRectMake(100, 250, 60, 30)];
    [searchBtn setTitle:@"dddddd" forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
//    [searchBtn setTitleWithIcon:@"\U0000e900" size:14 color:[UIColor darkGrayColor]];
    [searchBtn setImage:[UIImage imageWithIcon:@"\U0000e900" size:14 color:[UIColor magentaColor]] forState:UIControlStateNormal];
    [self.view addSubview:searchBtn];

    
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"-----------==============");
    _selectDatePicker = [[CustomDatePicker alloc] init];
    [_selectDatePicker checkDateWithDateString:@"09/01/01" startClick:YES];
    [_selectDatePicker didFinishSelectedDate:^(NSString *selectedDate) {
        NSLog(@"%@", selectedDate);
    }];
    

    
}








@end
