//
//  UINavigationBar+BackgroundColor.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/7.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "UINavigationBar+BackgroundColor.h"
#import <objc/runtime.h>

@interface UINavigationBar()

@property (nonatomic, strong) UIView *overlay;

@end

@implementation UINavigationBar (BackgroundColor)

static char overLayKey;

- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &overLayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overLayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hlt_setBackgroundColor:(UIColor *)color
{
    if (!self.overlay) {
        [self setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[[UIImage alloc] init]];
        
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
        self.overlay.backgroundColor = color;
        [self insertSubview:self.overlay atIndex:0];
    }else {
        self.overlay.backgroundColor = color;
    }
}
@end
