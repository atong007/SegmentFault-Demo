//
//  HLTNavigationController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/2.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTNavigationController.h"
#import "UIImage+HLTExtension.h"
#import "UINavigationBar+BackgroundColor.h"

@implementation HLTNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        NSDictionary *attributeDict = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
        self.navigationBar.titleTextAttributes = attributeDict;
        
//        UIImage *image = [[UIImage imageNamed:@"back_arrow_13x21_"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
//        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:image forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
//        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
        
//        self.navigationBar.barTintColor = nil;
        self.navigationBar.backgroundColor = nil;
        [self.navigationBar hlt_setBackgroundColor:kColorWithRGB(22, 153, 99)];

    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
