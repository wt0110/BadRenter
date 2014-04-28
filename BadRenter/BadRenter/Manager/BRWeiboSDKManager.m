//
//  BRWeiboSDKManager.m
//  BadRenter
//
//  Created by wangtao on 14-4-25.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "BRWeiboSDKManager.h"

//com.sina.weibo.SNWeiboSDKDemo
#define kWeiboAppKey         @"2956417372"
#define kWeiboSecretKey      @"58a4feeea602191dced6255a142f0790"

#define kRedirectURI         @"http://"

@implementation BRWeiboSDKManager
+ (BRWeiboSDKManager *)shareManager
{
    static BRWeiboSDKManager *_shareManager = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _shareManager = [[BRWeiboSDKManager alloc]init];
    });

    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kWeiboAppKey];

    return _shareManager;

    return nil;
}

#pragma mark-WBHttpRequestDelegate
- (void)loginWithWeibo:(NSDictionary *)userInfo scope:(NSString *)scope{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kRedirectURI;
    request.scope = scope;
    request.userInfo = userInfo;
    [WeiboSDK sendRequest:request];
}

- (void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error
{
}

- (void)request:(WBHttpRequest *)request didFinishLoadingWithDataResult:(NSData *)data
{
}


#pragma mark-WeiboSDKDelegate
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    if ([request isKindOfClass:WBProvideMessageForWeiboRequest.class])
    {
    }
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([self.delegate respondsToSelector:@selector(weiboLoginComplete:)]) {
        [self.delegate weiboLoginComplete:response];
    }
}

@end
