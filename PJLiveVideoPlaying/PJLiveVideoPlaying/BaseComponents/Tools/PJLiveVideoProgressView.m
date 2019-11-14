//
//  PJLiveVideoProgressView.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/11.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJLiveVideoSlider.h"
#import "PJLiveVideoProgressView.h"

@interface PJLiveVideoProgressView () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIProgressView *progressView; //! < 进度条

@property(nonatomic, strong) UITapGestureRecognizer *tapGstSliderTap; // 点击显示控件手势

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
        
        [self addTargetEventMonitor];
        
        [self addGestureRecognizer];
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
    
    progressView.progress = 0.0;
    progressView.progressTintColor = [UIColor colorWithWhite:1 alpha:0.3];
    progressView.trackTintColor  = [UIColor colorWithRed:81/255.0 green:81/255.0 blue:81/255.0 alpha:0.5];
    
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.centerY.mas_equalTo(self.mas_centerY).offset(1);
    }];
    
    PJLiveVideoSlider *viewSlider = [[PJLiveVideoSlider alloc] init];
    [self addSubview:viewSlider];
    _viewSlider = viewSlider;

    [viewSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

- (void)addTargetEventMonitor {

    [_viewSlider addTarget:self action:@selector(sliderDurationEnded:) forControlEvents: UIControlEventValueChanged];
    
    [_viewSlider addTarget:self action:@selector(sliderDurationMoving:) forControlEvents:UIControlEventValueChanged];

    [_viewSlider addTarget:self action:@selector(sliderDurationBeginTouch:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchCancel | UIControlEventTouchUpOutside];
}

- (void)addGestureRecognizer {
    UITapGestureRecognizer *tapGstSliderTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGstSlider:)];
    _tapGstSliderTap = tapGstSliderTap;
    
    tapGstSliderTap.delegate = self;
    
    [_viewSlider addGestureRecognizer:tapGstSliderTap];
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

- (void)tapGstSlider:(UITapGestureRecognizer *)tap {
    [self sliderDurationBeginTouch:_viewSlider];
    CGPoint point = [tap locationInView:tap.view];
    CGFloat value = point.x/ tap.view.frame.size.width;
    self.viewSlider.value = value;
    [self sliderDurationMoving:_viewSlider];
    [self sliderDurationEnded:_viewSlider];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (_tapGstSliderTap == gestureRecognizer) {
        return _viewSlider == gestureRecognizer.view;
    }else {
        return self == gestureRecognizer.view;
    }
}


@end
