//
//  PJPlayerFailedContentPage.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/14.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PJPlayerFailedContentPage : UIView

@property (nonatomic, copy) void(^playerFailedContentPageRetry)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
