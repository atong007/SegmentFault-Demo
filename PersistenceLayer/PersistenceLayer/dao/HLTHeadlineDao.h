//
//  HLTHeadlineDao.h
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLTHeadlineDao : NSObject

/**
 *  获取头条
 */
- (void)loadHeadlinesWithURLString:(NSString *)url
                        parameters:(id)parameters
                           success:(void (^)(NSArray *array))success
                           failure:(void (^)(NSError *error))failure;
@end
