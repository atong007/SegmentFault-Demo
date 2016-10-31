//
//  HLTHttpTool.h
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/10/30.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLTHttpTool : NSObject

+ (void)httpOfGetMethodWithURLString:(NSString *)url
                          parameters:(id)parameters
                             success:(void (^)(NSArray *responseObject))success
                             failure:(void (^)(NSError *error))failure;
@end
