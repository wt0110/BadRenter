//
//  BRLoginViewController.h
//  BadRenter
//
//  Created by wangtao on 14-4-25.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "BRBaseViewController.h"
#import "BRWeiboSDKManager.h"

@interface BRLoginViewController : BRBaseViewController<WBHttpRequestDelegate,BRWeiboSDKManagerDelegate>

- (IBAction)weiboLoginButtonClick:(id)sender;
@end
