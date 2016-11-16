//
//  HLTMyCollectionViewCell.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/12.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTMyCollectionViewCell.h"
#import "HLTMyCollectionCellItem.h"

@interface HLTMyCollectionViewCell()

@property (weak, nonatomic) IBOutlet UILabel *groupNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *objectCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *descripLabel;

@end
@implementation HLTMyCollectionViewCell

- (void)setCellItem:(HLTMyCollectionCellItem *)cellItem
{
    _cellItem = cellItem;
    self.groupNameLabel.text = cellItem.groupName;
    self.descripLabel.text = cellItem.descripStr;
    self.objectCountLabel.text = [NSString stringWithFormat:@"%ld 个条目", cellItem.objectCount.integerValue];
}


@end
