//
//  HLTQuestion.m
//  
//
//  Created by 洪龙通 on 2016/10/29.
//
//

#import "HLTQuestion.h"

@implementation HLTQuestion


+ (instancetype)questionWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    return;
}
@end
