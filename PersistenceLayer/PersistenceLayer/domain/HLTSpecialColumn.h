//
//  HLTSpecialColumn.h
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/10/31.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLTSpecialColumn : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *excerpt;
@property (nonatomic, copy) NSString *votes;
@property (nonatomic, copy) NSString *bookmarks;
@property (nonatomic, copy) NSString *userName;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)specialColumnWithDictionary:(NSDictionary *)dict;
@end
