//
//  HLTSpecialColumnNavigationBar.h
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/4.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTBaseNavigationBar.h"
#import "HLTProtocol.h"

@interface HLTSpecialColumnNavigationBar : HLTBaseNavigationBar

@property (nonatomic, weak) id<HLTProtocolDelegate> delegate;

+ (instancetype)navigationBarWithTags:(NSArray *)tagsArray;
@end
