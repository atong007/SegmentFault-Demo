//
//  HLTNavigationController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/2.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTNavigationController.h"
#import "HLTNavigationBar.h"

@implementation HLTNavigationController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        HLTNavigationBar *customNavigationBar = [[HLTNavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.navigationBar.frame.size.width, 100)];
        [self.navigationBar addSubview:customNavigationBar];
    }
    return self;
}

/**
 *  在此之前设置的navigationBar的frame会被重置
 */
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    self.navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
}

@end
