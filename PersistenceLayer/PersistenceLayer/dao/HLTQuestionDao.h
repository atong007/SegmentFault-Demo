//
//  HLTQuestionDao.h
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/10/29.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HLTQuestion;
@interface HLTQuestionDao : NSObject

/**
 *  获取问题(最新的、全部、未回答的)
 */
- (void)loadQuestionsWithURLString:(NSString *)url
                        parameters:(id)parameters
                           success:(void (^)(NSArray *array))success
                           failure:(void (^)(NSError *error))failure;

/**
 *  查找记录
 */
//- (NSArray *)findByString:(NSString *)string;

/**
 *  创建新问题
 */
//- (void)createNewQuestion:(HLTQuestion *)question;

@end
