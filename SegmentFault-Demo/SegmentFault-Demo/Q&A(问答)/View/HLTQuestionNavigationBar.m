//
//  HLTQuestionNavigationBar.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/4.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTQuestionNavigationBar.h"

@interface HLTQuestionNavigationBar()

@property (nonatomic, strong) UIButton *currentTabBtn;
@end
@implementation HLTQuestionNavigationBar

+ (instancetype)navigationBarWithTags:(NSArray *)tagsArray {
    
    CGFloat naviBarW = [UIScreen mainScreen].bounds.size.width;
    CGFloat naviBarH = 100;
    
    HLTQuestionNavigationBar *questionNaviBar = [[self alloc] initWithFrame:CGRectMake(0, 0, naviBarW, naviBarH)];
    questionNaviBar.userInteractionEnabled = YES;
    
    CGFloat sequenceBtnW = 46;
    CGFloat sequenceBtnH = sequenceBtnW;
    CGFloat sequenceBtnX = naviBarW - sequenceBtnW;
    CGFloat sequenceBtnY = naviBarH - sequenceBtnH + 5;
    UIButton *sequenceButton = [[UIButton alloc] initWithFrame:CGRectMake(sequenceBtnX, sequenceBtnY, sequenceBtnW, sequenceBtnH)];
    [sequenceButton setImage:[UIImage imageNamed:@"arrow_down_14x8_"] forState:UIControlStateNormal];
    [questionNaviBar addSubview:sequenceButton];
    
    CGFloat tagButtonH = 35;
    CGFloat tagButtonX = 10;
    for (int i = 0; i < tagsArray.count; i++) {
        UIButton *tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [tagButton addTarget:questionNaviBar action:@selector(tagButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        tagButton.tag = i;
        tagButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [tagButton setTitle:tagsArray[i] forState:UIControlStateNormal];
        NSDictionary *attributesDict = @{NSFontAttributeName: [UIFont systemFontOfSize:15.0]};
        CGFloat tagButtonW = [tagsArray[i] sizeWithAttributes:attributesDict].width + 15;
        tagButton.frame = CGRectMake(tagButtonX, naviBarH - tagButtonH, tagButtonW, tagButtonH);
        [questionNaviBar addSubview:tagButton];
        tagButtonX += tagButtonW;
        if (i == 0) {
            questionNaviBar.currentTabBtn = tagButton;
            continue;
        }
        tagButton.alpha = 0.6;
    }
    return questionNaviBar;
}

- (void)tagButtonClicked:(UIButton *)tagButton
{
    self.currentTabBtn.alpha = 0.6;
    tagButton.alpha = 1.0;
    self.currentTabBtn = tagButton;
    NSLog(@"%d", tagButton.tag);
}
@end
