//
//  HLTTabBar.h
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/1.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HLTTabBarDelegate <NSObject>

- (void)changeViewControllerToIndex:(NSUInteger)index;

@end
@interface HLTTabBar : UIImageView

@property (nonatomic, weak) id<HLTTabBarDelegate> delegate;
- (void)addTabButtonWithTabBarItem:(UITabBarItem *)tabBarItem;
@end
