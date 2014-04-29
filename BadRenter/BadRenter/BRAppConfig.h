//
//  BRAppConfig.h
//  BadRenter
//
//  Created by wangtao on 14-4-25.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRAppConfig : NSObject
//获取设备操作系统版本号
@property (nonatomic, copy) NSString *deviceScreenBoundsRecord;
// app id
@property (nonatomic, copy) NSString *appId;
// 本应用在appStore的ID
@property (nonatomic, copy) NSString* appStoreId;
// Open Platform API Key
@property (nonatomic, copy) NSString *pubdate;
// Open Platform API Key
@property (nonatomic, copy) NSString *opApiKey;

@end
