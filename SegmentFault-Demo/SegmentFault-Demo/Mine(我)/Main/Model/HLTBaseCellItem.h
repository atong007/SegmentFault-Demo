//
//  HLTBaseCellItem.h
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/10.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^actionBlock)();

@interface HLTBaseCellItem : NSObject

/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  右边标题
 */
@property (nonatomic, copy) NSString *detailTitle;

/**
 *  section的标题
 */
@property (nonatomic, copy) NSString *headerTitle;

/**
 *  图片
 */
@property (nonatomic, copy) NSString *iconStr;

/**
 *  cell右侧的view
 */
@property (nonatomic, assign, readonly) BOOL hasAccessoryView;

/**
 *  cell的点击动作
 */
@property (nonatomic, copy) actionBlock action;

/**
 *  cell跳转后的目标控制器
 */
@property (nonatomic, assign) Class destClass;

+ (instancetype)setItemWithTitle:(NSString *)title destClass:(id)destClass;
@end