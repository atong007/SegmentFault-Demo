//
//  HLTNavigationBar.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/2.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTNavigationBar.h"

#define kTopToolViewMargin 10
#define kColorWithRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface HLTNavigationBar() <UISearchBarDelegate>

@property (nonatomic, weak) UIButton *cancelButton;
@property (nonatomic, weak) UIButton *editButton;

@end

@implementation HLTNavigationBar 

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
        editButton.frame = CGRectMake(screenWidth - buttonW - kTopToolViewMargin, 20, buttonW, buttonH);
        [self addSubview:editButton];
        [editButton addTarget:self action:@selector(editButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.editButton = editButton;
        
        UIButton *cancelButton = [[UIButton alloc] initWithFrame:editButton.frame];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(cancelSearch) forControlEvents:UIControlEventTouchUpInside];
        cancelButton.hidden = YES;
        [self addSubview:cancelButton];
        self.cancelButton = cancelButton;
        
        UISearchBar *searchBar = [[UISearchBar alloc] init];
        searchBar.searchBarStyle = UISearchBarStyleMinimal;
        searchBar.placeholder = @"搜索内容、标签和用户";
        searchBar.frame = CGRectMake(kTopToolViewMargin, 25, CGRectGetMinX(editButton.frame) - kTopToolViewMargin * 2, 40);
        searchBar.delegate = self;
        [self addSubview:searchBar];
    }
    return self;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"changed!");
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    self.editButton.hidden = YES;
    self.cancelButton.hidden = NO;
    return YES;
}

- (void)editButtonClicked:(UIButton *)button
{
    
}

- (void)cancelSearch
{
    [self endEditing:YES];
    self.cancelButton.hidden = YES;
    self.editButton.hidden = NO;
}
@end
