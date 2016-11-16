//
//  HLTAboutMeHeaderView.h
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/6.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HLTAboutMeHeaderViewDelegate <NSObject>

- (void)changeAboutMeContentViewWithTitle:(NSString *)title;

@end

@interface HLTAboutMeHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIView *buttonsView;
//@property (weak, nonatomic) UIView *buttonsView;
@property (nonatomic, weak) id<HLTAboutMeHeaderViewDelegate> delegate;
@end
