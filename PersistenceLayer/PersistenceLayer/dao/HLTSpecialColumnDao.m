//
//  HLTSpecialColumnDao.m
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTSpecialColumnDao.h"
#import "HLTSpecialColumn.h"
#import "HLTHttpTool.h"

@implementation HLTSpecialColumnDao

+ (instancetype)sharedInstance {
    static HLTSpecialColumnDao *specailColumnDao = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        specailColumnDao = [[HLTSpecialColumnDao alloc] init];
    });
    return specailColumnDao;
}

- (instancetype)init
{
    return [[self class] sharedInstance];
}

- (void)loadSpecialColumnsWithURLString:(NSString *)url parameters:(id)parameters success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    [HLTHttpTool httpOfGetMethodWithURLString:url parameters:parameters success:^(NSArray *responseObject) {
        
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (NSDictionary *dict in responseObject) {
            HLTSpecialColumn *specialColumn = [HLTSpecialColumn specialColumnWithDictionary:dict];
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
