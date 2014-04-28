//
//  BRAppContext.h
//  BadRenter
//
//  Created by wangtao on 14-4-25.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BRWeiboSDKManager.h"
#import "BRAppUser.h"

@interface BRAppContext : NSObject

@property (nonatomic, readonly) BRWeiboSDKManager *weiboManager;
@property (nonatomic, readonly) BRAppUser *currentUser;
+ (BRAppContext *)shareInstance;
@end
