//
//  HLTMineViewController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/1.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTMineViewController.h"
#import "HLTMyFollowingViewController.h"
#import "HLTAboutMeViewController.h"
#import "HLTMyCollectionViewController.h"
#import "HLTSettingViewController.h"
#import "HLTBaseCellItem.h"

@interface HLTMineViewController()

@end

@implementation HLTMineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"用户";
    
    // 第一个主视图不需要左边的返回button
    self.navigationItem.leftBarButtonItem = nil;
    
    // 设置视图内容
    [self setupControllers];
}

/**
 *  设置视图内容
 */
- (void)setupControllers
{
    HLTBaseCellItem *aboutMe = [HLTBaseCellItem setItemWithTitle:@"atong007" destClass:[HLTAboutMeViewController class]];
    aboutMe.iconStr = @"avatar_big_75x75_";
    NSArray *firstGroup = @[aboutMe];
    [self.controllersArray addObject:firstGroup];
    
    HLTBaseCellItem *myMessage = [HLTBaseCellItem setItemWithTitle:@"我的关注" destClass:[HLTMyFollowingViewController class]];
    HLTBaseCellItem *myCollection = [HLTBaseCellItem setItemWithTitle:@"我的收藏" destClass:[HLTMyCollectionViewController class]];
    
    NSArray *secondGroup = @[myMessage, myCollection];
    [self.controllersArray addObject:secondGroup];
    
    HLTBaseCellItem *setting = [HLTBaseCellItem setItemWithTitle:@"设置" destClass:[HLTSettingViewController class]];

    NSArray *thirdGroup = @[setting];
    [self.controllersArray addObject:thirdGroup];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 60;
    }
    return 44;
}
@end
