//
//  HLTQuestionNavigationController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/4.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTQuestionNavigationController.h"
#import "HLTQuestionNavigationBar.h"

@interface HLTQuestionNavigationController ()

@end

@implementation HLTQuestionNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        NSArray *tagsArray = @[@"推荐的", @"热门的", @"全部的"];
        HLTQuestionNavigationBar *customNavigationBar = [HLTQuestionNavigationBar navigationBarWithTags:tagsArray];
        self.navigationBar.userInteractionEnabled = YES;
        [self.navigationBar addSubview:customNavigationBar];
        customNavigationBar.delegate = rootViewController;
    }
    return self;
}

@end
