//
//  HLTHeadline.h
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLTHeadline : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, strong) NSNumber *votesWord;
@property (nonatomic, strong) NSNumber *comments;
@property (nonatomic, copy) NSString *readFirstImg;
@property (nonatomic, copy) NSArray *newsTypes;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)headlineWithDictionary:(NSDictionary *)dict;
@end
