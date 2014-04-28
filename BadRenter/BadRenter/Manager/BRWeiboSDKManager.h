//
//  BRWeiboSDKManager.h
//  BadRenter
//
//  Created by wangtao on 14-4-25.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BRWeiboSDKManagerDelegate <NSObject>
- (void)weiboLoginInterrupt:(WBBaseResponse *)respose;
- (void)weiboLoginComplete:(WBBaseResponse *)respose;
@end

@interface BRWeiboSDKManager : NSObject<WBHttpRequestDelegate, WeiboSDKDelegate>
@property (nonatomic, weak) id<BRWeiboSDKManagerDelegate> delegate;

+ (BRWeiboSDKManager *)shareManager;
- (void)loginWithWeibo:(NSDictionary *)userInfo scope:(NSString *)scope;
@end
