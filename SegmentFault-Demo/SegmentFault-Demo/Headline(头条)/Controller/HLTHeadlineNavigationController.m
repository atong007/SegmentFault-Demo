//
//  HLTHeadlineNavigationController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/3.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTHeadlineNavigationController.h"
#import "HLTHeadlineNavigationBar.h"

@interface HLTHeadlineNavigationController ()

@end

@implementation HLTHeadlineNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        NSArray *tagsArray = @[@"全部", @"前端", @"后端", @"iOS", @"Android", @"安全", @"工具", @"程序猿", @"行业"];
        HLTHeadlineNavigationBar *customNavigationBar = [HLTHeadlineNavigationBar navigationBarWithTags:tagsArray];
        
        self.navigationBar.userInteractionEnabled = YES;
        [self.navigationBar addSubview:customNavigationBar];
        customNavigationBar.delegate = rootViewController;
    }
    return self;
}

@end
