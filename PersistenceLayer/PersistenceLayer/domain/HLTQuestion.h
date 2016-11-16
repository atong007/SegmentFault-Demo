//
//  HLTQuestion.h
//  
//
//  Created by 洪龙通 on 2016/10/29.
//
//

#import <Foundation/Foundation.h>

@interface HLTQuestion : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, copy) NSString *answers;
@property (nonatomic, copy) NSArray *tags;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)questionWithDictionary:(NSDictionary *)dict;
@end
