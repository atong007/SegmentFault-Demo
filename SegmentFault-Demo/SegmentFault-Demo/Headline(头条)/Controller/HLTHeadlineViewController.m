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
#import "UIImageView+WebCache.h"
#import "HLTProtocol.h"

@interface HLTHeadlineViewController ()<HLTProtocolDelegate>

@property (nonatomic, copy) NSArray *headlinesArray;
@property (nonatomic, copy) NSArray *channelsArray;

@end

@implementation HLTHeadlineViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadHeadlineListWithChannel:@""];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 80;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
    
    UINib *nib = [UINib nibWithNibName:@"HLTHeadlineViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"HLTHeadlineViewCell"];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.frame = CGRectMake(0, 20, self.view.frame.size.width, 100);
}

- (NSArray *)headlinesArray
{
    if (!_headlinesArray) {
        _headlinesArray = [NSArray array];
    }
    return _headlinesArray;
}

- (NSArray *)channelsArray
{
    return @[@"", @"frontend", @"backend", @"ios", @"android", @"netsec", @"tools", @"programmer", @"industry"];
}

- (void)loadHeadlineListWithChannel:(NSString *)channel
{
    HLTHeadlineBL *headlineBL = [[HLTHeadlineBL alloc] init];
    __weak typeof(self) weakSelf = self;
    [headlineBL loadHeadlinesWithChannel:channel rank:@"rank" success:^(NSArray *array) {
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.headlinesArray = array;
        [strongSelf.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"loadHeadlineList Error:%@", error);
    }];
}

// HLTHeadlineNavigationBarDelegate
- (void)changeTagsViewToIndex:(NSUInteger)index
{
    [self loadHeadlineListWithChannel:self.channelsArray[index]];
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
    
    //2.传递数据模型来设置cell属性
    HLTHeadline *headline = self.headlinesArray[indexPath.row];
    cell.titleLabel.text = headline.title;
    cell.userNameLabel.text = headline.userName;
    cell.createdDateLabel.text = headline.createdDate;
    if (headline.readFirstImg) {
        cell.thumbImageView.hidden = NO;
        [cell.thumbImageView sd_setImageWithURL:[NSURL URLWithString:headline.readFirstImg]];
    }else {
        cell.thumbImageView.hidden = YES;
    }
    [cell.voteButton setTitle:[NSString stringWithFormat:@"%@", headline.votesWord] forState:UIControlStateNormal];
    [cell.commentButton setTitle:[NSString stringWithFormat:@"%@", headline.comments] forState:UIControlStateNormal];
    
    //3.返回cell
    return cell;
}

@end
