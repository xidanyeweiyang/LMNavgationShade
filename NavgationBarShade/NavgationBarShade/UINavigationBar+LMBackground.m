//
//  UINavigationBar+LMBackground.m
//  NavgationBarShade
//
//  Created by 刘明 on 16/8/26.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "UINavigationBar+LMBackground.h"
#import <objc/runtime.h>

@implementation UINavigationBar (LMBackground)

static char overLayKey;

- (UIView *)overlay{
    
    return objc_getAssociatedObject(self, &overLayKey);
}

- (void)setOverlay:(UIView *)overLay
{
    
    objc_setAssociatedObject(self, &overLayKey, overLay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)LMSetBackgroundColor:(UIColor *)backgroundColor{
    
    if (!self.overlay) {
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        
        self.overlay.userInteractionEnabled = NO;
        
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        [self insertSubview:self.overlay atIndex:0];
        
    }
    
    self.overlay.backgroundColor = backgroundColor;

}
- (void)LMReset{
    
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    [self.overlay removeFromSuperview];
    
    self.overlay = nil;
}
@end
