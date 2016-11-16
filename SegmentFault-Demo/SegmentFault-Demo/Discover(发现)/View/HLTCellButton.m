//
//  HLTCellButton.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/5.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTCellButton.h"

#define kHLTCellButtonScale 0.85

@implementation HLTCellButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
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
    CGFloat imageH = contentRect.size.height * kHLTCellButtonScale;;
    return CGRectMake(0, 0, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * kHLTCellButtonScale;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(10, titleY, titleW, titleH);
}

@end
