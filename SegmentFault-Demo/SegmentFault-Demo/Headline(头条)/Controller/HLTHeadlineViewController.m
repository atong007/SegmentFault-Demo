//
//  HLTHeadlineViewController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTHeadlineViewController.h"
#import "BusinessLogicLayer/HLTHeadlineBL.h"
#import "PersistenceLayer/HLTHeadline.h"
#import "HLTHeadlineViewCell.h"


@interface HLTHeadlineViewController ()

@property (nonatomic, copy) NSArray *headlinesArray;
@end

@implementation HLTHeadlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadHeadlineList];
    
    self.tableView.rowHeight = 80;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0);
    
    UINib *nib = [UINib nibWithNibName:@"HLTHeadlineViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"HLTHeadlineViewCell"];
}

- (NSArray *)headlinesArray
{
    if (!_headlinesArray) {
        _headlinesArray = [NSArray array];
    }
    return _headlinesArray;
}

- (void)loadHeadlineList
{
    HLTHeadlineBL *headlineBL = [[HLTHeadlineBL alloc] init];
    __weak typeof(self) weakSelf = self;
    [headlineBL loadHeadlinesWithChannel:@"" rank:@"rank" success:^(NSArray *array) {
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.headlinesArray = array;
        [strongSelf.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"loadHeadlineList Error:%@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.headlinesArray.count;
}

/**
 *  tableView cell的设置
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    static NSString *reuseID = @"HLTHeadlineViewCell";
    HLTHeadlineViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
//    if (cell == nil) {
//        cell = [[HLTHeadlineViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
//    }
    
    //2.传递数据模型来设置cell属性
    HLTHeadline *headline = self.headlinesArray[indexPath.row];
    cell.titleLabel.text = headline.title;
    cell.createdDateLabel.text = headline.createdDate;
    [cell.voteButton setTitle:[NSString stringWithFormat:@"%@", headline.votesWord] forState:UIControlStateNormal];
    
    //3.返回cell
    return cell;
}

@end
