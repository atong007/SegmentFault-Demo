//
//  HLTMyCollectionViewController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/6.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTMyCollectionViewController.h"
#import "HLTMyCollectionCellItem.h"
#import "UIImage+HLTExtension.h"
#import "HLTCollectionCreatedViewController.h"
#import "HLTMyCollectionViewCell.h"


@interface HLTMyCollectionViewController () <HLTCollectionCreatedViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *lineList;
@end

@implementation HLTMyCollectionViewController

static NSString *reuseID = @"HLTMyCollectionViewCell";


- (instancetype)init {
    
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        UIImage *image = [[UIImage imageNamed:@"back_arrow_13x21_"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(goBackAction)];
    }
    return self;
}

- (void)goBackAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我的收藏";
    
    self.tableView.rowHeight = 60;
    [self setupHeaderView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HLTMyCollectionViewCell" bundle:nil] forCellReuseIdentifier:reuseID];
}

- (void)setupHeaderView
{
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);

    UIButton *headerViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headerViewBtn.backgroundColor = [UIColor whiteColor];
    [headerViewBtn setTitle:@"+ 创建收藏夹" forState:UIControlStateNormal];
    [headerViewBtn setTitleColor:kColorWithRGB(21, 153, 99) forState:UIControlStateNormal];
    headerViewBtn.bounds = CGRectMake(0, 0, self.tableView.frame.size.width, 44);
    [headerViewBtn addTarget:self action:@selector(pushToCreatingCollection) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableHeaderView = headerViewBtn;
}

- (NSArray *)lineList
{
    if (!_lineList) {
        _lineList = [NSMutableArray array];
    }
    return _lineList;
}

- (void)pushToCreatingCollection
{
    HLTCollectionCreatedViewController *collectionCreatedVC = [[HLTCollectionCreatedViewController alloc] init];
    collectionCreatedVC.delegate = self;
    [self.navigationController pushViewController:collectionCreatedVC animated:YES];
}

- (void)addNewCollection:(HLTMyCollectionCellItem *)newItem
{
    [self.lineList addObject:newItem];
    [self.tableView reloadData];
}

#pragma mark - table view datasource & delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lineList.count;
}

/**
 *  tableView cell的设置
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    HLTMyCollectionViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    
    //2.传递数据模型来设置cell属性
    HLTMyCollectionCellItem *cellItem = self.lineList[indexPath.row];
    cell.cellItem = cellItem;
    
    //3.返回cell
    return cell;
}

@end
