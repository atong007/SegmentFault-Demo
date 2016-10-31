//
//  HLTUserDao.h
//  PersistenceLayer
//
//  Created by 洪龙通 on 2016/10/29.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HLTUser;
@interface HLTUserDao : NSObject

- (void)loginWithUserInfo:(HLTUser *)user;
- (void)userLogout;
@end
