//
//  HLTHeadlineNavigationBar.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/3.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTHeadlineNavigationBar.h"

#define kHeadlineNaviMargin 10

@interface HLTHeadlineNavigationBar() <UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *currentTabBtn;
@end
@implementation HLTHeadlineNavigationBar

+ (instancetype)navigationBarWithTags:(NSArray *)tagsArray {
    
    CGFloat naviBarW = [UIScreen mainScreen].bounds.size.width;
    CGFloat naviBarH = 100;
    
    HLTHeadlineNavigationBar *headlineNaviBar = [[self alloc] initWithFrame:CGRectMake(0, 0, naviBarW, naviBarH)];
    headlineNaviBar.userInteractionEnabled = YES;
    
    CGFloat sequenceBtnW = 46;
    CGFloat sequenceBtnH = sequenceBtnW;
    CGFloat sequenceBtnX = naviBarW - sequenceBtnW;
    CGFloat sequenceBtnY = naviBarH - sequenceBtnH;
    UIButton *sequenceButton = [[UIButton alloc] initWithFrame:CGRectMake(sequenceBtnX, sequenceBtnY, sequenceBtnW, sequenceBtnH)];
    [sequenceButton setImage:[UIImage imageNamed:@"sequence_21x17_"] forState:UIControlStateNormal];
    [headlineNaviBar addSubview:sequenceButton];
    
    CGFloat scollViewH = 35;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, naviBarH - scollViewH, naviBarW - sequenceBtnW - kHeadlineNaviMargin, scollViewH)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = headlineNaviBar;
    CGFloat tagButtonX = 10;
    for (int i = 0; i < tagsArray.count; i++) {
        UIButton *tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [tagButton addTarget:headlineNaviBar action:@selector(tagButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        tagButton.tag = i;
        tagButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [tagButton setTitle:tagsArray[i] forState:UIControlStateNormal];
        NSDictionary *attributesDict = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0]};
        CGFloat tagButtonW = [tagsArray[i] sizeWithAttributes:attributesDict].width + 15;
        tagButton.frame = CGRectMake(tagButtonX, 0, tagButtonW, scollViewH);
        [scrollView addSubview:tagButton];
        tagButtonX += tagButtonW;
        if (i == 0) {
            headlineNaviBar.currentTabBtn = tagButton;
            continue;
        }
        tagButton.alpha = 0.6;
    }
    scrollView.contentSize = CGSizeMake(tagButtonX, scollViewH);
    scrollView.contentOffset = CGPointMake(0, 0);

    [headlineNaviBar addSubview:scrollView];
    
    return headlineNaviBar;
}

- (void)tagButtonClicked:(UIButton *)tagButton
{
    self.currentTabBtn.alpha = 0.6;
    tagButton.alpha = 1.0;
    self.currentTabBtn = tagButton;
    NSLog(@"%d", tagButton.tag);
}

@end
