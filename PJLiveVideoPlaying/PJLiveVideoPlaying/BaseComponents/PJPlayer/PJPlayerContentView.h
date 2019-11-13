//
//  PJPlayerContentView.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/7.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJPlayerHandle.h"

NS_ASSUME_NONNULL_BEGIN

@interface PJPlayerContentView : UIView

@property (nonatomic, strong) PJPlayerHandle *playerHandle;

@property (nonatomic, assign) BOOL isFullScreen;

/** 用播放源进行播放 */
- (void)playWithVideoUrl:(NSString *)videoUrl;

- (void)fullScreenStatusChange;
- (void)smallScreenStatusChange;

@end

NS_ASSUME_NONNULL_END
