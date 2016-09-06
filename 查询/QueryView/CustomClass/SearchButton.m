//
//  SearchButton.m
//  查询
//
//  Created by 王卫亮 on 16/8/24.
//  Copyright © 2016年 王卫亮. All rights reserved.
//

#import "SearchButton.h"
#import "UIImage+IconFont.h"

@implementation SearchButton


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setUI];
    }
    return self;
}


- (void)setUI {
//    [self setImage:[UIImage imageNamed:@"downwards"] forState:UIControlStateNormal];
    self.layer.borderWidth = 1.0;
    self.layer.borderColor= [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:204/255.0].CGColor;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;

}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    /*
    CGRect titleRect = self.titleLabel.frame;
    CGRect imgRect = self.imageView.frame;
    
    CGFloat titleX = titleRect.origin.x;
    
    titleRect.origin.x = titleX - imgRect.size.width;

    imgRect.origin.x = titleX + titleRect.size.width - imgRect.size.width;
    
    self.imageView.frame = imgRect;0
    
    self.titleLabel.frame = titleRect;
     */
    
    
    CGRect titleRect = self.titleLabel.frame;
    titleRect.origin.x = 3.0;
    self.titleLabel.frame = titleRect;
    
    
    
    
    CGRect imgRect = self.imageView.frame;
    imgRect.origin.x = self.frame.size.width - 15;
//    imgRect.size.width = 10;
//    imgRect.size.height = 10;
//    imgRect.origin.y = (self.frame.size.height - 10) * 0.5;
    
    self.imageView.frame = imgRect;
//    self.imageView.center.y = self.titleLabel.center.y;
    

//    [self setImage:[UIImage imageWithIcon:@"\U0000e900" size:10 color:[UIColor redColor]] forState:UIControlStateNormal];

    
}

@end
