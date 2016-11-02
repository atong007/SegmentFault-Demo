//
//  HLTHeadlineDao.m
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTHeadlineDao.h"
#import "HLTHttpTool.h"
#import "HLTHeadline.h"

@implementation HLTHeadlineDao

+ (instancetype)sharedInstance {
    static HLTHeadlineDao *headlineDao = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        headlineDao = [[HLTHeadlineDao alloc] init];
    });
    return headlineDao;
}

- (void)loadHeadlinesWithURLString:(NSString *)url parameters:(id)parameters success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    [HLTHttpTool httpOfGetMethodWithURLString:url parameters:parameters success:^(NSArray *responseObject) {
        
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (NSDictionary *dict in responseObject) {
            HLTHeadline *headline = [HLTHeadline headlineWithDictionary:dict];
            [mutableArray addObject:headline];
        }
        success(mutableArray);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
