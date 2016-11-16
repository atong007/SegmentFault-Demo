//
//  HLTActivityBL.m
//  BusinessLogicLayer
//
//  Created by 洪龙通 on 2016/11/5.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTActivityBL.h"
#import "PersistenceLayer/HLTActivityDao.h"


#define kURLOfSpecialColumn @"https://api.segmentfault.com/activity/type?page=1"

@implementation HLTActivityBL

- (void)loadActivityWithType:(NSString *)type parameters:(id)parameters success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    HLTActivityDao *activityDao = [HLTActivityDao sharedInstance];
    NSString *urlString = [kURLOfSpecialColumn stringByReplacingOccurrencesOfString:@"type" withString:type];
    
    [activityDao loadActivityWithURLString:urlString parameters:nil success:^(NSArray *array) {
        if (success) {
            success(array);
        }
    } failure:^(NSError *error) {
        if (failure) {
            NSLog(@"loadActivityWithType Error!");
            failure(error);
        }
    }];
}
@end
