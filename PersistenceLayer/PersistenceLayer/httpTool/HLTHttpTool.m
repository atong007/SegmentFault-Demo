//
//  HLTHttpTool.m
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/10/30.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTHttpTool.h"
#import "AFNetworking.h"

@implementation HLTHttpTool


+ (void)httpOfGetMethodWithURLString:(NSString *)url parameters:(id)parameters success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"3" forHTTPHeaderField:@"X-Version"];
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *data = responseObject[@"data"];
        if (data && success) {
            NSArray *array = data[@"rows"];
            success(array);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
