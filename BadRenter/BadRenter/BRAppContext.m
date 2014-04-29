//
//  BRAppContext.m
//  BadRenter
//
//  Created by wangtao on 14-4-25.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "BRAppContext.h"
static NSString * const kLastLoginUserId = @"kLastLoginUserId";

@implementation BRAppContext
@synthesize weiboManager = _weiboManager;
@synthesize currentUser = _currentUser;
@synthesize lastUserId = _lastUserId;

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
        if (self.lastUserId) {
            _currentUser = [BRAppUser userInfoById:self.lastUserId];
        }
    }
    return _currentUser;
}

- (void)setCurrentUser:(BRAppUser *)currentUser
{
    _currentUser = currentUser;
    if (currentUser.userID) {
        _lastUserId = currentUser.userID;
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:_lastUserId forKey:kLastLoginUserId];
    }
}

- (NSString *)lastUserId
{
    if (!_lastUserId) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        _lastUserId = [userDefaults objectForKey:kLastLoginUserId];
    }

    return _lastUserId;
}
@end
