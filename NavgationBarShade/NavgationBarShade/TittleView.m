//
//  TittleView.m
//  NavgationBarShade
//
//  Created by 刘明 on 16/8/26.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "TittleView.h"

@implementation TittleView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
       
        [self setupUI];

    }
    
    return self;
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
//    [self setupUI];

}
- (void)setupUI{
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 4 - 20, 5, 40, 40)];
    
    imageView.layer.cornerRadius = 20;
    imageView.layer.masksToBounds = YES;

    
    imageView.image = [UIImage imageNamed:@"headIcon"];
    
    [self addSubview:imageView];
    
    
    UILabel *tittleName = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 4 + 40, 5, 200, 40)];
    
    tittleName.text = @"采蘑菇的小姑娘";
    
    tittleName.font = [UIFont systemFontOfSize:16];
    
    tittleName.textColor = [UIColor orangeColor];
    
    [self addSubview:tittleName];
    
}

@end
