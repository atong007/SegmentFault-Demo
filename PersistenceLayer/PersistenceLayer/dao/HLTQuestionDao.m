//
//  HLTQuestionDao.m
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/10/29.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTQuestionDao.h"
#import "HLTHttpTool.h"
#import "HLTQuestion.h"

@implementation HLTQuestionDao

- (void)loadQuestionsWithURLString:(NSString *)url parameters:(id)parameters success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
	[HLTHttpTool httpOfGetMethodWithURLString:url parameters:parameters success:^(NSArray *responseObject) {
        
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (NSDictionary *dict in responseObject) {
            HLTQuestion *question = [HLTQuestion questionWithDictionary:dict];
            [mutableArray addObject:question];
        }
        success(mutableArray);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
