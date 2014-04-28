//
//  BRAppContext.m
//  BadRenter
//
//  Created by wangtao on 14-4-25.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "BRAppContext.h"

@implementation BRAppContext
@synthesize weiboManager = _weiboManager;
@synthesize currentUser = _currentUser;

+ (BRAppContext *)shareInstance
{
    static BRAppContext *_shareContext;
    static dispatch_once_t _onceToken;

    dispatch_once(&_onceToken, ^{
        _shareContext = [[BRAppContext alloc]init];
    });

    return _shareContext;
}

- (BRWeiboSDKManager *)weiboManager
{
    if (!_weiboManager) {
        _weiboManager = [BRWeiboSDKManager shareManager];
    }
    return _weiboManager;
}

- (BRAppUser *)currentUser
{
    if (!_currentUser) {
        //对user进行逆归档
    }
    return _currentUser;
}
@end
