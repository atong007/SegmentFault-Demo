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

@interface HLTQuestionViewController ()

@property (nonatomic, copy) NSArray *questionsArray;
@end

@implementation HLTQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadQuestionList];
}

- (NSArray *)questionsArray
{
    if (!_questionsArray) {
        _questionsArray = [NSArray array];
    }
    return _questionsArray;
}

- (void)loadQuestionList
{
    HLTQuestionBL *questionBL = [[HLTQuestionBL alloc] init];
    __weak typeof(self) weakSelf = self;
    [questionBL loadQuestionsWithType:@"newest" parameters:nil success:^(NSArray *array) {
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.questionsArray = array;
        [strongSelf.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"loadQuestionList Error:%@", error);
    }];
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
    static NSString *reuseID = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    //2.传递数据模型来设置cell属性
    HLTQuestion *question = self.questionsArray[indexPath.row];
    cell.textLabel.text = question.title;
    
    //3.返回cell
    return cell;
}

@end
