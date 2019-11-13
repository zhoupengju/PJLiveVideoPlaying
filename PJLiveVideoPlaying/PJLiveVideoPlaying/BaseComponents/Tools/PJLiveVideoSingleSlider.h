//
//  PJLiveVideoSingleSlider.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/13.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PJLiveVideoSingleSliderDelegate <NSObject>

- (void)PJLiveVideoProgressViewSliderBegin;

- (void)PJLiveVideoProgressViewSliderMoving:(UISlider *)slider;

- (void)PJLiveVideoProgressViewSliderEnd:(UISlider *)slider;

@end

@interface PJLiveVideoSingleSlider : UISlider

@property(nonatomic, assign) CGFloat cacheProgressValue;

@property (nonatomic, weak) id<PJLiveVideoSingleSliderDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
