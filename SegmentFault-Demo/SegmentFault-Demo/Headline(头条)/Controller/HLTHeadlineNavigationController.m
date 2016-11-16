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

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSArray *tagsArray = @[@"全部", @"前端", @"后端", @"iOS", @"Android", @"安全", @"工具", @"程序猿", @"行业"];
        HLTHeadlineNavigationBar *customNavigationBar = [HLTHeadlineNavigationBar navigationBarWithTags:tagsArray];
        self.navigationBar.userInteractionEnabled = YES;
        [self.navigationBar addSubview:customNavigationBar];
    }
    return self;
}

@end
