//
//  BRAppUser.m
//  BadRenter
//
//  Created by wangtao on 14-4-25.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "BRAppUser.h"

@implementation BRAppUser

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.userID =[aDecoder decodeObjectForKey:@"userID"];
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.accessToken = [aDecoder decodeObjectForKey:@"accessToken"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.userID forKey:@"userID"];
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.accessToken forKey:@"accessToken"];
}
@end
