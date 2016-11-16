//
//  HLTTabBarController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/1.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTTabBarController.h"
#import "HLTTabBar.h"
#import "HLTHeadlineViewController.h"
#import "HLTQuestionViewController.h"
#import "HLTSpecialColumnViewController.h"
#import "HLTMineViewController.h"
#import "HLTNavigationController.h"
#import "HLTHeadlineNavigationController.h"
#import "HLTQuestionNavigationController.h"
#import "HLTDiscoverViewController.h"
#import "HLTSpecialColumnNavigationController.h"


@interface HLTTabBarController () <HLTTabBarDelegate>

@property (nonatomic, weak) HLTTabBar *customTabBar;
@end

@implementation HLTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    // 创建自定义的TabBar
    [self setupTabBar];
    
    // 创建添加所有的子控制器
    [self setupViewControllers];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 删除系统自带的tabBar按钮
    for (UIView *childView in self.tabBar.subviews) {
        if ([childView isKindOfClass:[UIControl class]]) {
            [childView removeFromSuperview];
        }
    }
}

/**
 *  创建自定义的TabBar
 */
- (void)setupTabBar
{
    HLTTabBar *customTabBar = [[HLTTabBar alloc] init];
    customTabBar.delegate = self;
    customTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  创建添加所有的子控制器
 */
- (void)setupViewControllers
{
    // 1.头条控制器
    HLTHeadlineViewController *headlineVC = [[HLTHeadlineViewController alloc] init];
    [self setupViewControllerWithController:headlineVC title:@"头条" imageName:@"headline_tab_icon_27x27_" selectedImageName:@"headline_tab_icon_selected_27x27_"];
    HLTHeadlineNavigationController *headlineNavi = [[HLTHeadlineNavigationController alloc] initWithRootViewController:headlineVC];

    HLTSpecialColumnViewController *specialColumnVC = [[HLTSpecialColumnViewController alloc] init];
    [self setupViewControllerWithController:specialColumnVC title:@"专栏" imageName:@"article_tab_icon_27x27_" selectedImageName:@"article_tab_icon_selected_27x27_"];
    HLTSpecialColumnNavigationController *specialColumnNavi = [[HLTSpecialColumnNavigationController alloc] initWithRootViewController:specialColumnVC];
    
    HLTQuestionViewController *questionVC = [[HLTQuestionViewController alloc] init];
    [self setupViewControllerWithController:questionVC title:@"问答" imageName:@"question_tab_icon_27x27_" selectedImageName:@"question_tab_icon_selected_27x27_"];
    HLTQuestionNavigationController *questionNavi = [[HLTQuestionNavigationController alloc] initWithRootViewController:questionVC];
    
    HLTDiscoverViewController *discoverVC = [[HLTDiscoverViewController alloc] init];
    [self setupViewControllerWithController:discoverVC title:@"发现" imageName:@"circle_tab_icon_27x27_" selectedImageName:@"circle_tab_icon_selected_27x27_"];
    HLTNavigationController *discoverNavi = [[HLTNavigationController alloc] initWithRootViewController:discoverVC];
    
    HLTMineViewController *mineVC = [[HLTMineViewController alloc] init];
    [self setupViewControllerWithController:mineVC title:@"我" imageName:@"mine_tab_icon_27x27_" selectedImageName:@"mine_tab_icon_selected_27x27_"];
    HLTNavigationController *mineNavi = [[HLTNavigationController alloc] initWithRootViewController:mineVC];
    
    self.viewControllers = @[headlineNavi, specialColumnNavi, questionNavi, discoverNavi, mineNavi];
}

- (void)setupViewControllerWithController:(id)VC title:(NSString *)title imageName:(NSString *)image selectedImageName:(NSString *)selectedImage
{
    UIViewController *viewController = VC;
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    
    [self.customTabBar addTabButtonWithTabBarItem:viewController.tabBarItem];
}

- (void)changeViewControllerToIndex:(NSUInteger)index
{
    self.selectedIndex = index;
}

@end
