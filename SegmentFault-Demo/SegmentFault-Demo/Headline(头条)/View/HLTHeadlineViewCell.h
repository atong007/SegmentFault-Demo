//
//  HLTHeadlineViewCell.h
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLTHeadlineViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *voteButton;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@end
