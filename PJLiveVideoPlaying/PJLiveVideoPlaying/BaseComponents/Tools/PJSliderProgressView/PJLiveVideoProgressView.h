//
//  PJLiveVideoProgressView.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/11.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJLiveVideoSlider.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PJLiveVideoProgressViewDelegate <NSObject>

- (void)PJLiveVideoProgressViewSliderBegin;

- (void)PJLiveVideoProgressViewSliderMoving:(PJLiveVideoSlider *)slider;

- (void)PJLiveVideoProgressViewSliderEnd:(PJLiveVideoSlider *)slider;

@end

@interface PJLiveVideoProgressView : UIView

@property (nonatomic, strong) PJLiveVideoSlider *viewSlider;    //! < 播放进度条

@property(nonatomic, assign) CGFloat cacheProgressValue;

@property (nonatomic, weak) id<PJLiveVideoProgressViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
