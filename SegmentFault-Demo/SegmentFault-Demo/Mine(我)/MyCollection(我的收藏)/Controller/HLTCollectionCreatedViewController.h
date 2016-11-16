//
//  HLTCollectionCreatedViewController.h
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/11.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLTMyCollectionCellItem;
@protocol HLTCollectionCreatedViewControllerDelegate <NSObject>

- (void)addNewCollection:(HLTMyCollectionCellItem *)newItem;

@end
@interface HLTCollectionCreatedViewController : UIViewController

@property (nonatomic, weak) id<HLTCollectionCreatedViewControllerDelegate> delegate;
@end
