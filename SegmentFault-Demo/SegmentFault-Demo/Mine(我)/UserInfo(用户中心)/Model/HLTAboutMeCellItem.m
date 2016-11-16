//
//  HLTAboutMeCellItem.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/10.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTAboutMeCellItem.h"

@implementation HLTAboutMeCellItem


+ (instancetype)setItemWithTitle:(NSString *)title countNumber:(NSNumber *)number destClass:(id)destClass {
    HLTAboutMeCellItem *cellItem = [super setItemWithTitle:title destClass:destClass];
    cellItem.detailTitle = [NSString stringWithFormat:@"%@",number];
    return cellItem;
}

@end
