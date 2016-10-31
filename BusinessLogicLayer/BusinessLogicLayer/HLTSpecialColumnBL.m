//
//  HLTSpecialColumnBL.m
//  BusinessLogicLayer
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTSpecialColumnBL.h"
#import "PersistenceLayer/HLTSpecialColumnDao.h"

#define kURLOfSpecialColumn @"https://api.segmentfault.com/article/type?page=1"

@implementation HLTSpecialColumnBL

- (void)loadSpecialColumnsWithType:(NSString *)type parameters:(id)parameters success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    HLTSpecialColumnDao *specialColumnDao = [HLTSpecialColumnDao sharedInstance];
    NSString *urlString = [kURLOfSpecialColumn stringByReplacingOccurrencesOfString:@"type" withString:type];
    
    [specialColumnDao loadSpecialColumnsWithURLString:urlString parameters:nil success:^(NSArray *array) {
        if (success) {
            success(array);
        }
    } failure:^(NSError *error) {
        if (failure) {
            NSLog(@"loadSpecialColumnsWithType Error!");
            failure(error);
        }
    }];
}
@end
