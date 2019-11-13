//
//  PJVideoPlayingController.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/6.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJPlayerContentView.h"
#import "PJLiveVideoPlayingBaseController.h"

#define viewPlayerContentH 216

NS_ASSUME_NONNULL_BEGIN

@interface PJVideoPlayingController : PJLiveVideoPlayingBaseController

@property (nonatomic, strong) PJPlayerContentView *viewPlayerContent;

@end

NS_ASSUME_NONNULL_END
