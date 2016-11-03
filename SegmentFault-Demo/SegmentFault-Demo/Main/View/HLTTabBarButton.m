//
//  HLTTabBarButton.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/1.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTTabBarButton.h"

#define kHLTTabBarButtonScale 0.7
#define kColorWithRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@implementation HLTTabBarButton

/**
 *  指定初始化方法
 *
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.font = [UIFont systemFontOfSize:11.0];
        [self setTitleColor:kColorWithRGB(150, 150, 150) forState:UIControlStateNormal];
        [self setTitleColor:kColorWithRGB(21, 153, 99) forState:UIControlStateSelected];
    }
    return self;
}

/**
 *  取消按钮点击高亮
 */
- (void)setHighlighted:(BOOL)highlighted{}


- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * kHLTTabBarButtonScale;;
    return CGRectMake(0, 0, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * kHLTTabBarButtonScale;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

@end
