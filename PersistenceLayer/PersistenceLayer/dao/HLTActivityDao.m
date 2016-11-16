//
//  HLTActivityDao.m
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/11/5.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTActivityDao.h"
#import "HLTHttpTool.h"
#import "HLTActivity.h"

@implementation HLTActivityDao

+ (instancetype)sharedInstance {
    static HLTActivityDao *activityDao = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        activityDao = [[HLTActivityDao alloc] init];
    });
    return activityDao;
}

- (void)loadActivityWithURLString:(NSString *)url parameters:(id)parameters success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    [HLTHttpTool httpOfGetMethodWithURLString:url parameters:parameters success:^(NSArray *responseObject) {
        
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (NSDictionary *dict in responseObject) {
            HLTActivity *specialColumn = [HLTActivity activityWithDictionary:dict];
            [mutableArray addObject:specialColumn];
        }
        success(mutableArray);
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}
@end
