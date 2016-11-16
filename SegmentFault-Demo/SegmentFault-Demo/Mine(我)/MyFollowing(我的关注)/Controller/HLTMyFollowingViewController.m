//
//  HLTMyFollowingViewController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/5.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTMyFollowingViewController.h"
#import "HLTMyFollowCellItem.h"

@interface HLTMyFollowingViewController ()

@end

@implementation HLTMyFollowingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我的关注";
    
    [self setupControllers];
}

- (void)setupControllers
{
    HLTMyFollowCellItem *followingPerson = [HLTMyFollowCellItem setItemWithTitle:@"关注的人" destClass:nil];
    HLTMyFollowCellItem *tag = [HLTMyFollowCellItem setItemWithTitle:@"标签" destClass:nil];
    HLTMyFollowCellItem *question = [HLTMyFollowCellItem setItemWithTitle:@"问题" destClass:nil];
    HLTMyFollowCellItem *specialColumn = [HLTMyFollowCellItem setItemWithTitle:@"专栏" destClass:nil];
    HLTMyFollowCellItem *collection = [HLTMyFollowCellItem setItemWithTitle:@"收藏夹" destClass:nil];
    [self.controllersArray addObject:@[followingPerson, tag, question, specialColumn, collection]];
}

@end
