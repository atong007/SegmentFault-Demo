//
//  HLTSettingViewController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/6.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTSettingViewController.h"
#import "HLTPushNoteSettingViewController.h"
#import "MBProgressHUD.h"

@interface HLTSettingViewController ()

@end

@implementation HLTSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置";
    [self setupControllers];
}

- (void)setupControllers
{
    HLTBaseCellItem *pushNoteSetting = [HLTBaseCellItem setItemWithTitle:@"消息推送设置" destClass:[HLTPushNoteSettingViewController class]];
    
    [self.controllersArray addObject:@[pushNoteSetting]];
    
    HLTBaseCellItem *feedback = [HLTBaseCellItem setItemWithTitle:@"意见反馈" destClass:[HLTPushNoteSettingViewController class]];
    HLTBaseCellItem *version = [HLTBaseCellItem setItemWithTitle:@"当前版本" destClass:[HLTPushNoteSettingViewController class]];
    version.detailTitle = @"1.0";
    version.action = ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.label.text = @"已是最新版本";
        [hud hideAnimated:YES afterDelay:1.0];
    };
    [self.controllersArray addObject:@[feedback, version]];
    
    HLTBaseCellItem *logout = [HLTBaseCellItem setItemWithTitle:@"退出登录" destClass:[HLTPushNoteSettingViewController class]];
    
    [self.controllersArray addObject:@[logout]];
}

@end
