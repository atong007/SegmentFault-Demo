//
//  HLTQuestionViewController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTQuestionViewController.h"
#import "BusinessLogicLayer/HLTQuestionBL.h"
#import "PersistenceLayer/HLTQuestion.h"
#import "HLTQuesiontViewCell.h"
#import "HLTProtocol.h"


@interface HLTQuestionViewController () <HLTProtocolDelegate>

@property (nonatomic, copy) NSArray *questionsArray;
@property (nonatomic, copy) NSArray *typesArray;

@end

@implementation HLTQuestionViewController

static NSString *reuseID = @"UITableViewCell";

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadQuestionListWithType:@"newest"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 88;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 注册cell
    [self.tableView registerClass:[HLTQuesiontViewCell class] forCellReuseIdentifier:reuseID];
    
//    HLTQuestionNavigationController *customNaviController = (HLTQuestionNavigationBar *)    self.navigationController;
//    customNaviController.customNavigationBar.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // 需要将navigationBar的frame高度设置为100，navigationBar上头的按钮无法响应，因为navigationBar会被重置为原来的大小，所以超过原有范围的按钮也无法响应
    self.navigationController.navigationBar.frame = CGRectMake(0, 20, self.view.frame.size.width, 100);
}

- (NSArray *)questionsArray
{
    if (!_questionsArray) {
        _questionsArray = [NSArray array];
    }
    return _questionsArray;
}

- (NSArray *)typesArray
{
    return @[@"newest", @"hottest", @"recommendable"];
}

- (void)loadQuestionListWithType:(NSString *)type
{
    HLTQuestionBL *questionBL = [[HLTQuestionBL alloc] init];
    __weak typeof(self) weakSelf = self;
    [questionBL loadQuestionsWithType:type parameters:nil success:^(NSArray *array) {
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.questionsArray = array;
        [strongSelf.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"loadQuestionList Error:%@", error);
    }];
}

- (void)changeTagsViewToIndex:(NSUInteger)index
{
    [self loadQuestionListWithType:self.typesArray[index]];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.questionsArray.count;
}

/**
 *  tableView cell的设置
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    HLTQuesiontViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    //2.传递数据模型来设置cell属性
    HLTQuestion *question = self.questionsArray[indexPath.row];
    cell.question = question;
    
    //3.返回cell
    return cell;
}

@end
