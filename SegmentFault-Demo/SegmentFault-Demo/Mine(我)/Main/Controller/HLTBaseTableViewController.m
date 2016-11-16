//
//  HLTBaseTableViewController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/5.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTBaseTableViewController.h"

@interface HLTBaseTableViewController ()

@end

@implementation HLTBaseTableViewController

static NSString *reuseID = @"UITableViewCell";

- (instancetype)init {
    
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        UIImage *image = [[UIImage imageNamed:@"back_arrow_13x21_"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(goBackAction)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseID];
}

- (void)goBackAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSMutableArray *)controllersArray
{
    if (!_controllersArray) {
        _controllersArray = [NSMutableArray array];
    }
    return _controllersArray;
}

#pragma mark - tableView dataSource & delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.controllersArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.controllersArray[section];
    return array.count;
}

/**
 *  tableView cell的设置
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    //2.传递数据模型来设置cell属性
    HLTBaseCellItem *cellItem = self.controllersArray[indexPath.section][indexPath.row];
    cell.textLabel.text = cellItem.title;
    if (cellItem.detailTitle) {
        cell.detailTextLabel.text = cellItem.detailTitle;
    }else {
        cell.detailTextLabel.text = nil;
    }
    if (cellItem.iconStr) {
        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        cell.imageView.image = [UIImage imageNamed:cellItem.iconStr];
    }else{
        cell.imageView.image = nil;
    }
    if (cellItem.hasAccessoryView) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    //3.返回cell
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HLTBaseCellItem *cellItem = self.controllersArray[indexPath.section][indexPath.row];
    if (cellItem.action) {
        cellItem.action();
        return;
    }
    if (cellItem.destClass) {
        HLTBaseTableViewController *destVC = [[cellItem.destClass alloc] init];
        destVC.title = cellItem.title;
        [self.navigationController pushViewController:destVC animated:YES];
    }
}

@end
