//
//  HLTHeadlineBL.m
//  BusinessLogicLayer
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTHeadlineBL.h"
#import "PersistenceLayer/HLTHeadlineDao.h"

#define kURLOfHeadline @"https://api.segmentfault.com/news/rank?channel=ch&page=1"

@implementation HLTHeadlineBL

- (void)loadHeadlinesWithChannel:(NSString *)channel rank:(NSString *)rank success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    HLTHeadlineDao *headlineDao = [HLTHeadlineDao sharedInstance];
    NSString *urlString = [kURLOfHeadline stringByReplacingOccurrencesOfString:@"rank" withString:rank];
    if (channel.length < 1) {
        urlString = [urlString stringByReplacingOccurrencesOfString:@"=ch" withString:@""];
    }else {
        urlString = [urlString stringByReplacingOccurrencesOfString:@"ch" withString:channel];
    }

    [headlineDao loadHeadlinesWithURLString:urlString parameters:nil success:^(NSArray *array) {
        if (success) {
            success(array);
        }
    } failure:^(NSError *error) {
        if (failure) {
            NSLog(@"loadHeadlinesWithChannel Error!");
            failure(error);
        }
    }];
}
@end
