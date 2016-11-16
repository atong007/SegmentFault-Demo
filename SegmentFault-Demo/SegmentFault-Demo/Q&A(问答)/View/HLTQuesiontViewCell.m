//
//  HLTQuesiontViewCell.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/12.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTQuesiontViewCell.h"
#import "Masonry.h"
#import "HLTQuesiontViewCell.h"
#import "PersistenceLayer/HLTQuestion.h"

#define kQuestionTagFont [UIFont systemFontOfSize:11.0]
#define kTagNumberForAnswerBtn 11

@interface HLTQuesiontViewCell()

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIButton *answersBtn;
@property (nonatomic, weak) UILabel *createdDateLabel;
@property (nonatomic, copy) NSArray *tagsArray;
@property (nonatomic, weak) UIView *straightLine;
@property (nonatomic, strong) NSMutableArray *tagButtons;
@property (nonatomic, strong) NSArray *tagButtonContraints;

@end

@implementation HLTQuesiontViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.numberOfLines = 2;
    titleLabel.font = kTitleFont;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UIButton *answersBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    answersBtn.tag = kTagNumberForAnswerBtn;
    answersBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    answersBtn.titleLabel.font = kQuestionTagFont;
    [answersBtn setTitleColor:kColorWithRGB(21, 153, 99) forState:UIControlStateNormal];
    [answersBtn setBackgroundImage:[UIImage imageNamed:@"qa_state_29x34_"] forState:UIControlStateNormal];
    answersBtn.titleLabel.numberOfLines = 2;
    answersBtn.userInteractionEnabled = NO;
    [self.contentView addSubview:answersBtn];
    self.answersBtn = answersBtn;
    
    UILabel *createdDateLabel = [[UILabel alloc] init];
    createdDateLabel.font = kQuestionTagFont;
    createdDateLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:createdDateLabel];
    self.createdDateLabel = createdDateLabel;
    
    self.tagButtons = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UIButton *tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
        tagButton.hidden = YES;
        tagButton.tag = i;
        [self.contentView addSubview:tagButton];
        [self.tagButtons addObject:tagButton];
    }
    
    UIView *straightLine = [[UIView alloc] init];
    straightLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:straightLine];
    self.straightLine = straightLine;
}

- (NSArray *)tagButtonContraints
{
    if (!_tagButtonContraints) {
        _tagButtonContraints = [NSArray array];
    }
    return _tagButtonContraints;
}

- (void)updateConstraints
{
    [super updateConstraints];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(self).with.offset(10);
    }];
    
    [self.answersBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.top.equalTo(self).with.offset(10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(45);
    }];
    
    [self.createdDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.greaterThanOrEqualTo(self.answersBtn);
        make.height.mas_equalTo(10);
        make.right.equalTo(self.answersBtn);
        make.top.equalTo(self.answersBtn.mas_bottom).offset(10);
    }];
    
    [self.straightLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(0.3);
        make.width.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
}

- (void)setTagsArray:(NSArray *)tagsArray
{
    _tagsArray = [tagsArray copy];
    
    // 由于cell复用的原因，需要将之前的tag button清除
    for (UIButton *button in self.tagButtons) {
        if (!button.hidden) {
            button.hidden = YES;
            
        }
    }
    
    // 添加tag Button
    CGFloat tagButtonH = 20;
    CGFloat tagBtnMarginX = 0;
    for (int i = 0; i < tagsArray.count; i++) {
        NSDictionary *tagDict = tagsArray[i];
        NSString *nameStr = tagDict[@"name"];
        NSDictionary *attributeDict = @{NSFontAttributeName : kQuestionTagFont};
        CGFloat tagButtonW = [nameStr sizeWithAttributes:attributeDict].width + 5;
        UIButton *tagButton = self.tagButtons[i];
        tagButton.hidden = NO;
        [tagButton setTitleColor:kColorWithRGB(21, 153, 99) forState:UIControlStateNormal];
        [tagButton setTitle:nameStr forState:UIControlStateNormal];
        tagButton.titleLabel.font = kQuestionTagFont;
        [tagButton setBackgroundImage:[UIImage imageNamed:@"qa_state_29x34_"] forState:UIControlStateNormal];
        tagButton.userInteractionEnabled = NO;
        [self.contentView addSubview:tagButton];
        
        [tagButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10 * (i +1) + tagBtnMarginX);
            make.centerY.equalTo(self.createdDateLabel);
            make.width.mas_equalTo(tagButtonW);
            make.height.mas_equalTo(tagButtonH);
        }];
        
        tagBtnMarginX += tagButtonW;
    }
    [self setNeedsUpdateConstraints];
}

- (void)setQuestion:(HLTQuestion *)question
{
    _question = question;
    self.titleLabel.text = question.title;
    [self.answersBtn setTitle:[NSString stringWithFormat:@"%@\n回答", question.answers] forState:UIControlStateNormal];
    self.createdDateLabel.text = question.createdDate;
    self.tagsArray = question.tags;
}
@end
