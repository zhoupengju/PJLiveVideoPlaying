//
//  PJLiveVideoSingleSlider.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/13.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJLiveVideoSingleSlider.h"

@implementation PJLiveVideoSingleSlider
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //1. 参数初始化
        [self initParamConfig];
        
        [self addTargetEventMonitor];
    }
    return self;
}

- (void)initParamConfig {
    
    [self setThumbImage:[UIImage imageNamed:@"player-slider_spot"] forState:UIControlStateNormal];
    self.minimumTrackTintColor = [UIColor colorWithWhite:1 alpha:0.6];
    self.maximumTrackTintColor = [UIColor clearColor];
}

- (void)addTargetEventMonitor {

    [self addTarget:self action:@selector(sliderDurationEnded:) forControlEvents: UIControlEventValueChanged];
    
    [self addTarget:self action:@selector(sliderDurationMoving:) forControlEvents:UIControlEventValueChanged];

    [self addTarget:self action:@selector(sliderDurationBeginTouch:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchCancel | UIControlEventTouchUpOutside];
}

#pragma mark - 外部方法
#pragma mark - 设置缓存进度
- (void)setCacheProgressValue:(CGFloat)cacheProgressValue {
    _cacheProgressValue = cacheProgressValue;
//
//    if([[NSString stringWithFormat:@"%.3f", cacheProgressValue] floatValue] != 0){
//
//        [self.viewCacheProgress mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.bottom.equalTo(self);
//            make.width.equalTo(self.mas_width).multipliedBy(cacheProgressValue);
//        }];
//    }
}

#pragma mark - 内部方法
#pragma mark - 设置缓存进度
- (void)sliderDurationBeginTouch:(UISlider *)slider{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(PJLiveVideoProgressViewSliderBegin)]) {
        [self.delegate PJLiveVideoProgressViewSliderBegin];
    }
}

- (void)sliderDurationEnded:(UISlider *)slider{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(PJLiveVideoProgressViewSliderEnd:)]) {
        [self.delegate PJLiveVideoProgressViewSliderEnd:slider];
    }
}

- (void)sliderDurationMoving:(UISlider *)slider {
//    self.viewSlider.value = slider.value;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(PJLiveVideoProgressViewSliderMoving:)]) {
        [self.delegate PJLiveVideoProgressViewSliderMoving:slider];
    }
}

@end
