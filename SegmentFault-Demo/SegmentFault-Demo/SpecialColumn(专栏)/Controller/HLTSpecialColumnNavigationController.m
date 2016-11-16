//
//  HLTSpecialColumnNavigationController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/4.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTSpecialColumnNavigationController.h"
#import "HLTSpecialColumnNavigationBar.h"

@interface HLTSpecialColumnNavigationController ()

@end

@implementation HLTSpecialColumnNavigationController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSArray *tagsArray = @[@"最新的", @"热门的", @"未回答的"];
        HLTSpecialColumnNavigationBar *customNavigationBar = [HLTSpecialColumnNavigationBar navigationBarWithTags:tagsArray];
        self.navigationBar.userInteractionEnabled = YES;
        [self.navigationBar addSubview:customNavigationBar];
    }
    return self;
}

@end
