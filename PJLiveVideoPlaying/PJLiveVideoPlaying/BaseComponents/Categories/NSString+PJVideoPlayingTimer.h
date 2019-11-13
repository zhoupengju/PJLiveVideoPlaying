//
//  NSString+PJVideoPlayingTimer.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/11.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (PJVideoPlayingTimer)

+ (NSString *)formatSecondsToString:(NSInteger)seconds;

@end

NS_ASSUME_NONNULL_END
