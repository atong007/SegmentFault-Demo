//
//  HLTSpecialColumnViewController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTSpecialColumnViewController.h"
#import "BusinessLogicLayer/HLTSpecialColumnBL.h"
#import "PersistenceLayer/HLTSpecialColumn.h"
#import "HLTSpecialColumnViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"


@interface HLTSpecialColumnViewController ()

@property (nonatomic, copy) NSArray *specialColumnList;
@end

@implementation HLTSpecialColumnViewController

static NSString *reuseID = @"HLTSpecialColumnViewCell";

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadSpecialColumnList];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 110;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    // 注册cell
    [self.tableView registerClass:[HLTSpecialColumnViewCell class] forCellReuseIdentifier:reuseID];
    
    // 加载数据
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // 需要将navigationBar的frame高度设置为100，navigationBar上头的按钮无法响应，因为navigationBar会被重置为原来的大小，所以超过原有范围的按钮也无法响应
    self.navigationController.navigationBar.frame = CGRectMake(0, 20, self.view.frame.size.width, 100);
}

- (void)loadSpecialColumnList
{
    HLTSpecialColumnBL *specialColumnBL = [[HLTSpecialColumnBL alloc] init];
    __weak typeof(self) weakSelf = self;
    [specialColumnBL loadSpecialColumnsWithType:@"newest" parameters:nil success:^(NSArray *array) {
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.specialColumnList = array;
        [strongSelf.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"loadSpecialColumnList error:%@", error);
    }];
}

- (NSArray *)specialColumnList
{
    if (!_specialColumnList) {
        _specialColumnList = [NSArray array];
    }
    return _specialColumnList;
}

#pragma mark - table view datasource & delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.specialColumnList.count;
}

/**
 *  tableView cell的设置
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    HLTSpecialColumnViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    //2.传递数据模型来设置cell属性
    HLTSpecialColumn *specialColumn = self.specialColumnList[indexPath.row];
    cell.specialColumn = specialColumn;
    
    //3.返回cell
    return cell;
}
@end
