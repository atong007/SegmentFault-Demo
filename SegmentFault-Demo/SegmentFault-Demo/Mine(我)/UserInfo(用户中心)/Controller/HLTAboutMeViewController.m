//
//  HLTAboutMeViewController.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/5.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTAboutMeViewController.h"
#import "HLTAboutMeHeaderView.h"
#import "UINavigationBar+BackgroundColor.h"
#import "HLTMyQuestionViewController.h"
#import "HLTMyAnswersViewController.h"
#import "HLTMyArticlesViewController.h"
#import "HLTMyShareViewController.h"
#import "HLTAboutMeCellItem.h"
#import "Masonry.h"

#define kAboutMeHeaderViewTopOffset 64

@interface HLTAboutMeViewController () <UINavigationControllerDelegate, HLTAboutMeHeaderViewDelegate>

@property (nonatomic, weak) UIView *toolView;
@property (nonatomic, weak) HLTAboutMeHeaderView *headerView;
@property (nonatomic, weak) UILabel *titleView;
@end

@implementation HLTAboutMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupPersonalPageView];
    
    self.tableView.contentInset = UIEdgeInsetsMake(-kAboutMeHeaderViewTopOffset, 0, 0, 0);
    
    self.navigationController.delegate = self;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 25)];
    label.textColor = [UIColor colorWithWhite:1.0 alpha:0];
    label.text = self.title;
    self.titleView = label;
    self.navigationItem.titleView = label;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(edit)];
    
    // 添加headerView
    [self setupHeaderView];
}

- (void)dealloc
{
    // 如果当前界面中的toolView刚好添加到navigationBar上的话
    // 在返回上级页面时需要将toolView清除
    [self.toolView removeFromSuperview];
}

- (void)setupHeaderView
{
    HLTAboutMeHeaderView *headerView = [[HLTAboutMeHeaderView alloc] init];
    self.headerView = headerView;
    self.tableView.tableHeaderView = headerView;
    headerView.delegate = self;
    self.toolView = headerView.buttonsView;
}

/**
 *  HLTAboutMeHeaderViewDelegate委托方法
 */
- (void)changeAboutMeContentViewWithTitle:(NSString *)title
{
    [self.controllersArray removeAllObjects];
    if ([title isEqualToString:@"个人主页"]) {
        [self setupPersonalPageView];
    }else{
        [self setupPersonalFilesView];
    }
    [self.tableView reloadData];
}

- (void)setupPersonalPageView
{
    HLTBaseCellItem *myWebsite = [HLTBaseCellItem setItemWithTitle:@"个人网站" destClass:nil];
    HLTBaseCellItem *myIntroduction = [HLTBaseCellItem setItemWithTitle:@"简介" destClass:nil];
    [self.controllersArray addObject:@[myWebsite, myIntroduction]];

    HLTBaseCellItem *myQuestion = [HLTAboutMeCellItem setItemWithTitle:@"我的问题" countNumber:@0 destClass:[HLTMyQuestionViewController class]];
    HLTBaseCellItem *myAnswers = [HLTAboutMeCellItem setItemWithTitle:@"我的回答" countNumber:@0 destClass:[HLTMyAnswersViewController class]];
    HLTBaseCellItem *myArticles = [HLTAboutMeCellItem setItemWithTitle:@"我的文章" countNumber:@0 destClass:[HLTMyArticlesViewController class]];
    HLTBaseCellItem *myShare = [HLTAboutMeCellItem setItemWithTitle:@"我的分享" countNumber:@1 destClass:[HLTMyShareViewController class]];
    HLTBaseCellItem *myCollection = [HLTAboutMeCellItem setItemWithTitle:@"我的收藏" countNumber:@1 destClass:nil];

    [self.controllersArray addObject:@[myQuestion, myAnswers, myArticles, myShare, myCollection, myQuestion, myAnswers, myArticles, myShare, myCollection]];
}

- (void)setupPersonalFilesView
{
    HLTBaseCellItem *myCity = [HLTBaseCellItem setItemWithTitle:@"城市" destClass:nil];
    
    HLTBaseCellItem *myEducation = [HLTBaseCellItem setItemWithTitle:@"学历" destClass:nil];
    
    HLTBaseCellItem *myJob = [HLTAboutMeCellItem setItemWithTitle:@"工作" destClass:nil];
    [self.controllersArray addObject:@[myCity, myEducation, myJob]];

    HLTBaseCellItem *mySkills = [HLTAboutMeCellItem setItemWithTitle:@"暂无擅长技能" destClass:nil];
    mySkills.headerTitle = @"擅长技能";
    [self.controllersArray addObject:@[mySkills]];

    HLTBaseCellItem *myProjects = [HLTAboutMeCellItem setItemWithTitle:@"暂无项目和著作" destClass:nil];
    myProjects.headerTitle = @"项目&著作";
    [self.controllersArray addObject:@[myProjects]];

    HLTBaseCellItem *myLearningExperience = [HLTAboutMeCellItem setItemWithTitle:@"暂无学习经历" destClass:nil];
    myLearningExperience.headerTitle = @"学习经历";
    [self.controllersArray addObject:@[myLearningExperience]];

    HLTBaseCellItem *myWorkExperience = [HLTAboutMeCellItem setItemWithTitle:@"暂无工作经历" destClass:nil];
    myWorkExperience.headerTitle = @"工作经历";
    [self.controllersArray addObject:@[myWorkExperience]];
    
}

- (void)edit
{
    NSLog(@"edit!");
}

/**
 *  在NavigationController即将显示其中的ViewController时调用
 */
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 如果进入的是当前视图控制器
    if (viewController == self) {
        // 透明度设置为全透明
        [self.navigationController.navigationBar hlt_setBackgroundColor:[kColorWithRGB(22, 153, 99) colorWithAlphaComponent:0]];
    } else {
        // 进入其他视图控制器
        [self.navigationController.navigationBar hlt_setBackgroundColor:kColorWithRGB(22, 153, 99)];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 44;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    HLTBaseCellItem *cellItem = self.controllersArray[section][0];
    return cellItem.headerTitle;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (self.navigationController.viewControllers.count != 2)
    {
        return;
    }
    if (offsetY >= 0) {
        [self.navigationController.navigationBar hlt_setBackgroundColor:[kColorWithRGB(22, 153, 99) colorWithAlphaComponent:1 - ((180 - offsetY) / 180)]];
        self.titleView.textColor = [UIColor colorWithWhite:1.0 alpha:1 - ((180 - offsetY) / 180)];

        if (offsetY > 180) {
            self.toolView.frame = CGRectMake(0, 44, self.view.frame.size.width, 30);
            [self.navigationController.navigationBar addSubview:self.toolView];

        }else if (offsetY < 180){
            
            if ([self.toolView.superview isKindOfClass:[UINavigationBar class]]) {
                [self.headerView addSubview:self.toolView];
                
                [self.toolView mas_makeConstraints:^(MASConstraintMaker *make){
                    make.width.and.left.and.bottom.equalTo(self.toolView.superview);
                    
                }];
            }
        }
    }else{
        [self.navigationController.navigationBar hlt_setBackgroundColor:[kColorWithRGB(22, 153, 99) colorWithAlphaComponent:0]];
        self.titleView.textColor = [UIColor colorWithWhite:1.0 alpha:0];
    }
}

@end
