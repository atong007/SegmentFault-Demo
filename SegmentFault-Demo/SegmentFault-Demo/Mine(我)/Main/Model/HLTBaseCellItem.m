//
//  HLTBaseCellItem.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/10.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTBaseCellItem.h"

@implementation HLTBaseCellItem


+ (instancetype)setItemWithTitle:(NSString *)title destClass:(id)destClass {
	
    HLTBaseCellItem *cellItem = [[self alloc] init];
    cellItem.title = title;
    cellItem.destClass = destClass;
    return cellItem;
}

- (BOOL)hasAccessoryView
{
    return YES;
}
@end
