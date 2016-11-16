//
//  HLTActivityDao.h
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/11/5.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLTActivityDao : NSObject


/**
 *  获取活动信息
 */
- (void)loadActivityWithURLString:(NSString *)url
                       parameters:(id)parameters
                          success:(void (^)(NSArray *array))success
                          failure:(void (^)(NSError *error))failure;

+ (instancetype)sharedInstance;
@end
