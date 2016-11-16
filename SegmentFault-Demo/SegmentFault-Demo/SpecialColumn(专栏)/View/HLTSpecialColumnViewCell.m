//
//  HLTSpecialColumnViewCell.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/13.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTSpecialColumnViewCell.h"
#import "Masonry.h"
#import "PersistenceLayer/HLTSpecialColumn.h"

#define kSpecialColumnExcerptFont [UIFont systemFontOfSize:13.0]
#define kSpecialColumnUserNameFont [UIFont systemFontOfSize:12.0]
#define kSpecialColumnCollectionFont [UIFont systemFontOfSize:11.0]


@interface HLTSpecialColumnViewCell()

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *excerptLabel;
@property (nonatomic, weak) UILabel *votesLabel;
@property (nonatomic, weak) UILabel *bookmarksLabel;
@property (nonatomic, weak) UILabel *userNameLabel;
@property (nonatomic, weak) UIView *straightLine;

@end


@implementation HLTSpecialColumnViewCell

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
    
    UILabel *excerptLabel = [[UILabel alloc] init];
    excerptLabel.numberOfLines = 2;
    excerptLabel.font = kSpecialColumnExcerptFont;
    excerptLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:excerptLabel];
    self.excerptLabel = excerptLabel;
    
    UILabel *votesLabel = [[UILabel alloc] init];
    votesLabel.font = kSpecialColumnCollectionFont;
    votesLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:votesLabel];
    self.votesLabel = votesLabel;
    
    UILabel *bookmarksLabel = [[UILabel alloc] init];
    bookmarksLabel.font = kSpecialColumnCollectionFont;
    bookmarksLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:bookmarksLabel];
    self.bookmarksLabel = bookmarksLabel;
    
    UILabel *userNameLabel = [[UILabel alloc] init];
    userNameLabel.textAlignment = NSTextAlignmentRight;
    userNameLabel.font = kSpecialColumnUserNameFont;
    userNameLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:userNameLabel];
    self.userNameLabel = userNameLabel;
    
    UIView *straightLine = [[UIView alloc] init];
    straightLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:straightLine];
    self.straightLine = straightLine;
}

- (void)updateConstraints
{
    [super updateConstraints];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
    }];
    
    [self.excerptLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
        make.left.and.right.equalTo(self.titleLabel);
        make.height.mas_equalTo(35);
    }];
    
    [self.votesLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.mas_equalTo(50);
        make.left.equalTo(self.titleLabel).with.offset(5);
        make.top.equalTo(self.excerptLabel.mas_bottom).with.offset(10);
        make.height.mas_equalTo(20);
    }];
    
    [self.bookmarksLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.votesLabel);
        make.left.equalTo(self.votesLabel.mas_right).with.offset(10);
        make.height.equalTo(self.votesLabel);
        make.width.equalTo(self.votesLabel);
    }];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bookmarksLabel);
        make.right.equalTo(self.excerptLabel);
        make.bottom.equalTo(self).with.offset(-5);
        make.width.mas_greaterThanOrEqualTo(100);
    }];
    
    [self.straightLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(0.3);
        make.width.equalTo(self);
        make.bottom.equalTo(self);
    }];

}

- (void)setSpecialColumn:(HLTSpecialColumn *)specialColumn
{
    _specialColumn = specialColumn;
    self.titleLabel.text = specialColumn.title;
    self.excerptLabel.text = specialColumn.excerpt;
    self.votesLabel.text = [NSString stringWithFormat:@"%@人点赞", specialColumn.votes];
    self.bookmarksLabel.text = [NSString stringWithFormat:@"%@人收藏", specialColumn.bookmarks];
    self.userNameLabel.text = specialColumn.userName;
    [self setNeedsUpdateConstraints];
}

@end
