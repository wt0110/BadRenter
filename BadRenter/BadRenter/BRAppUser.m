//
//  BRAppUser.m
//  BadRenter
//
//  Created by wangtao on 14-4-25.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "BRAppUser.h"
#define kPersistDir  @"persist"
#define kLoginUserKey         @"kX2UserKey"

@implementation BRAppUser

+(BRAppUser*)userInfoById:(NSString *)userId
{
    return (BRAppUser*)[BRAppUser objectForKey:kLoginUserKey userId:userId];
}

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

- (void)persistence
{
    if (self.userID) {
        [BRAppUser setObject:self forKey:kLoginUserKey userId:self.userID];
    }
}


//从文件中取得用户信息
+ (NSObject *)objectForKey:(NSString *)key userId:(NSString *)userId {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[BRAppUser dataFilePathForKey:key userId:userId]];
}

//向文件中写入用户信息
+ (BOOL)setObject:(NSObject *)value forKey:(NSString *)key userId:(NSString *)userId {

    NSError *error = nil;

    if (![[NSFileManager defaultManager] createDirectoryAtPath:[BRAppUser persistFileDir] withIntermediateDirectories:YES attributes:nil error:&error]) {
        return NO;
    }
    return [NSKeyedArchiver archiveRootObject:value toFile:[BRAppUser dataFilePathForKey:key userId:userId]];
}

+ (NSString *)dataFilePathForKey:(NSString *)key userId:(NSString *)userId {
    NSString *documentDirectory = [self documentsDir];
    NSString *dir = [NSString stringWithFormat:@"%@/%@/X2_persistence_%@_object_%@", documentDirectory, kPersistDir,
                     [NSString stringWithFormat:@"%@",userId], key];
    return dir;
}

+ (NSString *)documentsDir {
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([searchPaths count] > 0) {
        return [searchPaths objectAtIndex:0];
    }
    else {
        return nil;
    }
}

+ (NSString *)persistFileDir {
    NSString *documentDirectory = [BRAppUser documentsDir];
    NSString *dir = [documentDirectory stringByAppendingPathComponent:kPersistDir];
    return dir;
}
@end
