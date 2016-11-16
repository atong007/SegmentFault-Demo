//
//  HLTAboutMeHeaderView.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/6.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTAboutMeHeaderView.h"

@interface HLTAboutMeHeaderView()

@property (weak, nonatomic) IBOutlet UIView *buttonBottomLine;
@property (weak, nonatomic) IBOutlet UIButton *personalPageBtn;
@property (weak, nonatomic) IBOutlet UIButton *personalFilesBtn;
@property (nonatomic, weak) UIButton *selectedBtn;
@end
@implementation HLTAboutMeHeaderView

- (instancetype)init
{
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    [self personalFiles:self.personalPageBtn];
    return self;
}

- (IBAction)personalFiles:(UIButton *)sender {
    if (sender.selected == NO) {
        self.selectedBtn.selected = NO;
        sender.selected = YES;
        self.selectedBtn = sender;
        self.buttonBottomLine.transform = CGAffineTransformTranslate(self.buttonBottomLine.transform, sender.frame.origin.x - self.buttonBottomLine.frame.origin.x, 0);
        
        if ([self.delegate respondsToSelector:@selector(changeAboutMeContentViewWithTitle:)]) {
            [self.delegate changeAboutMeContentViewWithTitle:sender.titleLabel.text];
        }
    }
}
@end
