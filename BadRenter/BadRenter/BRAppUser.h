//
//  BRAppUser.h
//  BadRenter
//
//  Created by wangtao on 14-4-25.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRAppUser : NSObject<NSCoding>
@property (nonatomic, copy)NSString *userID;
@property (nonatomic, copy)NSString *userName;
@property (nonatomic, copy)NSString *accessToken;

+(BRAppUser*)userInfoById:(NSString *)userId;
@end
