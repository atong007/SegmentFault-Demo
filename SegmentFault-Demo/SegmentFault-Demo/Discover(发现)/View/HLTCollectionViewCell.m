//
//  HLTCollectionViewCell.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/5.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTCollectionViewCell.h"
#import "HLTCellButton.h"

@implementation HLTCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        HLTCellButton *button = [HLTCellButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:button];
        self.button = button;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    HLTCellButton *button = self.contentView.subviews[0];
    button.frame = self.contentView.bounds;
}
@end
