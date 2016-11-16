//
//  HLTHeadline.m
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "HLTHeadline.h"

@implementation HLTHeadline

+ (instancetype)headlineWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setReadFirstImg:(NSString *)readFirstImg
{
    _readFirstImg = readFirstImg;
    if (_readFirstImg && ![_readFirstImg containsString:@"http"]) {
        _readFirstImg = [@"https://segmentfault.com" stringByAppendingString:_readFirstImg];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"user"]) {
        self.userName = value[@"name"];
    }
    return;
}
@end
