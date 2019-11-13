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

@property (nonatomic, strong) UIView *viewProgressBg;   //! < 背景颜色

@property (nonatomic, strong) UIView *viewCacheProgress;    //! < 缓存进度颜色

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
    
    // 背景颜色
    UIView *viewProgressBg = [[UIView alloc] init];
    [self addSubview:viewProgressBg];
    _viewProgressBg = viewProgressBg;
    
    viewProgressBg.backgroundColor = [UIColor grayColor];
    
    [viewProgressBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    // 缓存进度
    UIView *viewCacheProgress = [[UIView alloc] init];
    [self addSubview:viewCacheProgress];
    _viewCacheProgress = viewCacheProgress;

    viewCacheProgress.backgroundColor = [UIColor whiteColor];

    [viewCacheProgress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(self.mas_width).multipliedBy(0.0);
    }];

    PJLiveVideoSlider *viewSlider = [[PJLiveVideoSlider alloc] init];
    [self addSubview:viewSlider];
    _viewSlider = viewSlider;

    [viewSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];

    [viewSlider addTarget:self action:@selector(sliderDurationEnded:) forControlEvents: UIControlEventValueChanged];
    
        [viewSlider addTarget:self action:@selector(sliderDurationMoving:) forControlEvents:UIControlEventValueChanged];

    [viewSlider addTarget:self action:@selector(sliderDurationBeginTouch:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchCancel | UIControlEventTouchUpOutside];
}

#pragma mark - 外部方法
#pragma mark - 设置缓存进度
- (void)setCacheProgressValue:(CGFloat)cacheProgressValue {
    _cacheProgressValue = cacheProgressValue;
    
    if([[NSString stringWithFormat:@"%.3f", cacheProgressValue] floatValue] != 0){

        [self.viewCacheProgress mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self);
            make.width.equalTo(self.mas_width).multipliedBy(cacheProgressValue);
        }];
    }
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
