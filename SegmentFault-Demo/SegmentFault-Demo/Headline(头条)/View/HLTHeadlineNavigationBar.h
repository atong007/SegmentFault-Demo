//
//  HLTHeadlineNavigationBar.h
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/3.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTBaseNavigationBar.h"
#import "HLTProtocol.h"

@interface HLTHeadlineNavigationBar : HLTBaseNavigationBar

@property (nonatomic, weak) id<HLTProtocolDelegate> delegate;

+ (instancetype)navigationBarWithTags:(NSArray *)tagsArray;
@end
