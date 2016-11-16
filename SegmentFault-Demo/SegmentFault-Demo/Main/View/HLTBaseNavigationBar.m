//
//  HLTBaseNavigationBar.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/2.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTBaseNavigationBar.h"
#import "HLTSearchBar.h"

#define kTopToolViewMargin 10

@interface HLTBaseNavigationBar() <UITextFieldDelegate>

@property (nonatomic, weak) UIButton *cancelButton;
@property (nonatomic, weak) UIButton *editButton;
@property (nonatomic, weak) HLTSearchBar *searchBar;

@end

@implementation HLTBaseNavigationBar
{
    CGFloat searchBarOffset;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kColorWithRGB(21, 153, 99);
        
        CGFloat buttonW = 46;
        CGFloat buttonH = buttonW;
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        
        UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [editButton setImage:[UIImage imageNamed:@"create_content_btn_23x23_"] forState:UIControlStateNormal];
        editButton.frame = CGRectMake(screenWidth - buttonW, 10, buttonW, buttonH);
        [self addSubview:editButton];
        [editButton addTarget:self action:@selector(editButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.editButton = editButton;
        
        UIButton *cancelButton = [[UIButton alloc] initWithFrame:editButton.frame];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(cancelSearch) forControlEvents:UIControlEventTouchUpInside];
        cancelButton.hidden = YES;
        [self addSubview:cancelButton];
        self.cancelButton = cancelButton;
        
        HLTSearchBar *searchBar = [[HLTSearchBar alloc] init];
        searchBar.frame = CGRectMake(kTopToolViewMargin, 15, CGRectGetMinX(editButton.frame) - kTopToolViewMargin * 2, 30);
        NSDictionary *attributeDict = @{
                                        NSForegroundColorAttributeName : [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6],
                                        NSFontAttributeName : kSearchBarFont
                                        };
        
        searchBar.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索内容、标签和用户" attributes:attributeDict];
        CGFloat placeholderW = [searchBar.attributedPlaceholder.string sizeWithAttributes:attributeDict].width;
        searchBar.offset = (searchBar.frame.size.width - placeholderW) * 0.5;
        searchBarOffset = searchBar.offset;
        searchBar.delegate = self;
        [self addSubview:searchBar];
        
        self.searchBar = searchBar;
    }
    return self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.editButton.hidden = YES;
    self.cancelButton.hidden = NO;
}

- (void)editButtonClicked:(UIButton *)button
{
}

- (void)cancelSearch
{
    [self endEditing:YES];

    self.searchBar.offset = searchBarOffset;
    self.cancelButton.hidden = YES;
    self.editButton.hidden = NO;
}
@end
