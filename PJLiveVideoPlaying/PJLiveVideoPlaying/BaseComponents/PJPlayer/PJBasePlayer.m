//
//  PJBasePlayer.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/7.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJBasePlayer.h"

@interface PJBasePlayer ()

@end

@implementation PJBasePlayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //1. 添加通知
        [self addNotification];
    }
    return self;
}

#pragma mark - 添加通知
- (void)addNotification {
    // app退到后台
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterBackground) name:UIApplicationWillResignActiveNotification object:nil];
    // app进入前台
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterPlayGround) name:UIApplicationDidBecomeActiveNotification object:nil];
}

// 应用退到后台
- (void)appDidEnterBackground {
    [self pause];
}
// 应用进入前台
- (void)appDidEnterPlayGround {

}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
 
@end
