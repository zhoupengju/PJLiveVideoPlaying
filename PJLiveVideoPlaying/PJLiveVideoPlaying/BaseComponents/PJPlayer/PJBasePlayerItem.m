//
//  PJBasePlayerItem.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/7.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJBasePlayerItem.h"

@implementation PJBasePlayerItem

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
    

}



@end
