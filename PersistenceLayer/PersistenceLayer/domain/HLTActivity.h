//
//  HLTActivity.h
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/11/5.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLTActivity : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, copy) NSString *startDate;
@property (nonatomic, copy) NSString *startWeek;
@property (nonatomic, copy) NSString *bannerUrl;

+ (instancetype)activityWithDictionary:(NSDictionary *)dict;

@end
