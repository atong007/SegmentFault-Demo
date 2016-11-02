//
//  HLTQuestionBL.m
//  BusinessLogicLayer
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTQuestionBL.h"
#import "PersistenceLayer/HLTQuestionDao.h"

#define kURLOfQuestion @"https://api.segmentfault.com/question/type?page=1"

@implementation HLTQuestionBL

- (void)loadQuestionsWithType:(NSString *)type parameters:(id)parameters success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    HLTQuestionDao *questionDao = [HLTQuestionDao sharedInstance];
    NSString *urlString = [kURLOfQuestion stringByReplacingOccurrencesOfString:@"type" withString:type];
    [questionDao loadQuestionsWithURLString:urlString parameters:nil success:^(NSArray *array) {
        if (success) {
            success(array);
        }
    } failure:^(NSError *error) {
        if (failure) {
            NSLog(@"loadQuestionsWithType Error!");
            failure(error);
        }
    }];
}
@end
