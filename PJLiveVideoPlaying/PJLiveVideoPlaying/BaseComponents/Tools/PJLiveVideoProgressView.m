//
//  PJLiveVideoProgressView.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/11.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJLiveVideoSlider.h"
#import "PJLiveVideoProgressView.h"

@interface PJLiveVideoProgressView ()

@property (nonatomic, strong) UIProgressView *progressView; //! < 进度条

@end

@implementation PJLiveVideoProgressView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //1. 参数初始化
        [self initParamConfig];
        
        //2. 创建布局控件
        [self createContainerView];
    }
    return self;
}

- (void)initParamConfig {
    self.backgroundColor = [UIColor clearColor];
}

- (void)createContainerView {
    
    UIProgressView *progressView = [[UIProgressView alloc]init];
    [self addSubview:progressView];
    _progressView = progressView;
    
    progressView.progressTintColor = [UIColor colorWithWhite:1 alpha:0.3];
    progressView.trackTintColor  = [UIColor colorWithRed:81/255.0 green:81/255.0 blue:81/255.0 alpha:0.5];
    
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.mas_right);
        make.centerY.mas_equalTo(self.mas_centerY).offset(1);
    }];
}

#pragma mark - 外部方法
#pragma mark - 设置缓存进度
- (void)setCacheProgressValue:(CGFloat)cacheProgressValue {
    _cacheProgressValue = cacheProgressValue;
    
    [_progressView setProgress:cacheProgressValue animated:YES];
}

#pragma mark - 内部方法
#pragma mark - 设置缓存进度
- (void)sliderDurationBeginTouch:(PJLiveVideoSlider *)slider{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(PJLiveVideoProgressViewSliderBegin)]) {
        [self.delegate PJLiveVideoProgressViewSliderBegin];
    }
}

- (void)sliderDurationEnded:(PJLiveVideoSlider *)slider{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(PJLiveVideoProgressViewSliderEnd:)]) {
        [self.delegate PJLiveVideoProgressViewSliderEnd:slider];
    }
}

- (void)sliderDurationMoving:(PJLiveVideoSlider *)slider {
//    self.viewSlider.value = slider.value;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(PJLiveVideoProgressViewSliderMoving:)]) {
        [self.delegate PJLiveVideoProgressViewSliderMoving:slider];
    }
}

@end
