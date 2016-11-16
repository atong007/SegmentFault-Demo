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

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSArray *tagsArray = @[@"推荐的", @"热门的", @"全部的"];
        HLTQuestionNavigationBar *customNavigationBar = [HLTQuestionNavigationBar navigationBarWithTags:tagsArray];
        self.navigationBar.userInteractionEnabled = YES;
        [self.navigationBar addSubview:customNavigationBar];
    }
    return self;
}

@end
