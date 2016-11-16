//
//  HLTSearchBar.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/4.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTSearchBar.h"
#import "UIImage+HLTExtension.h"

static const NSUInteger kSearchBarMargin = 20;

@implementation HLTSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.6];
        self.font = kSearchBarFont;
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.3];
        self.borderStyle = UITextBorderStyleRoundedRect;
        
        UIImageView *searchIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_btn_13x13_"]];
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.tintColor = [UIColor whiteColor];
        self.clearButtonMode = UITextFieldViewModeWhileEditing;

    }
    return self;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    self.offset = 0;
    return [super editingRectForBounds:bounds];
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.origin.x + self.offset, 8, 13, 13);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.origin.x + self.offset + kSearchBarMargin, 0, bounds.size.width, bounds.size.height);
}

@end
