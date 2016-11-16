//
//  HLTMyCollectionTextField.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/11.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTMyCollectionTextField.h"

@interface HLTMyCollectionTextField()

@property (nonatomic, weak) UILabel *placeholderLabel;
@end

@implementation HLTMyCollectionTextField

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.textContainerInset = UIEdgeInsetsMake(20, 10, 0, 0);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 200, 35)];
    label.textColor = [UIColor lightGrayColor];
    label.font = [UIFont systemFontOfSize:14.0];
    [self addSubview:label];

    self.placeholderLabel = label;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    self.placeholderLabel.text = placeholder;
}
@end
