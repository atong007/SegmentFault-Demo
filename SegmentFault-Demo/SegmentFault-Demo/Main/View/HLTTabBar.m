//
//  HLTTabBar.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/1.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTTabBar.h"
#import "HLTTabBarButton.h"
#import "UIImage+HLTExtension.h"

#define kColorWithRGB(r, g, b) [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:1.0]

@interface HLTTabBar()

@property (nonatomic, strong) HLTTabBarButton *selectedButton;
@end
@implementation HLTTabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImageWithImageName:@"tabbar_bg_1x49_"];
    }
    return self;
}

- (void)addTabButtonWithTabBarItem:(UITabBarItem *)tabBarItem
{
    HLTTabBarButton *barButton = [HLTTabBarButton buttonWithType:UIButtonTypeCustom];
    [barButton setTitle:tabBarItem.title forState:UIControlStateNormal];
    [barButton setImage:tabBarItem.image forState:UIControlStateNormal];
    [barButton setImage:tabBarItem.selectedImage forState:UIControlStateSelected];
    [barButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:barButton];
}

- (void)layoutSubviews
{
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    for (int i = 0; i < self.subviews.count; i++) {
        HLTTabBarButton *barButton = self.subviews[i];
        barButton.tag = i;
        CGFloat buttonX = i * buttonW;
        CGFloat buttonY = 0;
        barButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        if (i == 0) {
            [self buttonClicked:barButton];
        }
    }
}

- (void)buttonClicked:(HLTTabBarButton *)button
{
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    if ([self.delegate respondsToSelector:@selector(changeViewControllerToIndex:)]) {
        [self.delegate changeViewControllerToIndex:button.tag];
    }
}
@end
