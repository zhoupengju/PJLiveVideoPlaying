//
//  PJPlayerContentView.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/7.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJPlayerContentView.h"
#import "PJLiveVideoProgressView.h"
#import "PJLiveVideoSingleSlider.h"

@interface PJPlayerContentView () <PJPlayerHandleDelegate, PJLiveVideoProgressViewDelegate>
{
    CGFloat totalTime;
}

@property (nonatomic, strong) UIImageView *imageviewDefault;

@property (nonatomic, strong) UILabel *labelTimeTotal;

@property (nonatomic, strong) UILabel *labelTimeCurrent;

@property (nonatomic, strong) UIButton *buttonPause;
@property (nonatomic, strong) UIButton *buttonPauseFullScreen;

@property (nonatomic, strong) UIButton *buttonFullScreen;

@property (nonatomic, strong) UIView *viewFullScreenBottom;

@property (nonatomic, strong) UIButton *buttonSetterFloatLayer;

@property (nonatomic, strong) PJLiveVideoProgressView *viewSlideProgress;

@end

@implementation PJPlayerContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //1. 播放器配置
        [self initParamConfig];
        
        //2. 创建主视图
        [self createContainerView];
        
        //3. 添加通知
        [self addObserver];
    }
    return self;
}

#pragma mark - 内部方法
#pragma mark - 播放器配置
- (void)initParamConfig {
    self.isFullScreen = NO;
}

#pragma mark - 创建主视图
- (void)createContainerView {

    //1. 默认图片
    [self createPlayerDefaultImage];
    
    //2. 添加播放器
    [self addPlayerHandle];
    
    //3. 创建顶部视图
    [self createPlayerTopView];
    
    //4. 创建底部视图
    [self createPlayerCommonBottomView];
    
    //4. 创建大屏底部视图
    [self createPlayerFullScreenBottomView];
}

- (void)addPlayerHandle {
    self.playerHandle.playerLayer.frame = self.bounds;
    if (![self.layer.sublayers containsObject:self.playerHandle.playerLayer]) {
        [self.layer addSublayer:self.playerHandle.playerLayer];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.playerHandle.playerLayer.frame = self.bounds;
}

- (void)createPlayerDefaultImage {
    UIImageView *imageviewDefault = [UIImageView pj_imageViewWithImage:@"BootDiagram.jpg" superView:self constraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    _imageviewDefault = imageviewDefault;
    imageviewDefault.contentMode = UIViewContentModeScaleToFill;
}

- (void)createPlayerTopView {
    UIButton *buttonBack = [UIButton pj_buttonWithImage:@"playerBackButton" superView:self constraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(20);
        make.left.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(44, 24));
    } touchUp:^(UIButton *sender) {
        [self controlBackAction];
    }];
    
    UILabel *labelTitle = [UILabel pj_labelWithFont:14 superView:self constraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(buttonBack.mas_right).offset(-5);
        make.centerY.mas_equalTo(buttonBack.mas_centerY);
    }];
    
    labelTitle.textColor = kWhile;
    labelTitle.text = @"中医学理论体系的主要特点";
    
    UIButton *buttonSetterFloatLayer = [UIButton pj_buttonWithImage:@"moreButton" superView:self constraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-40);
        make.centerY.mas_equalTo(buttonBack.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    } touchUp:^(UIButton *sender) {
        [self controlSetterFloatLayerAction];
    }];
    _buttonSetterFloatLayer = buttonSetterFloatLayer;
    
    buttonSetterFloatLayer.hidden = YES;
}

- (void)createPlayerCommonBottomView {
    
    UIButton *buttonFullScreen = [UIButton pj_buttonWithImage:@"fullScreen" superView:self constraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(50, 44));
    } touchUp:^(UIButton *sender) {
        
        sender.selected = !sender.selected;
            
        [self smallFullScreenTransformation:sender.selected];
    }];
    _buttonFullScreen = buttonFullScreen;
    
    UILabel *labelTimeTotal = [UILabel pj_labelWithFont:12 color:kWhile superView:self constraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(buttonFullScreen.mas_left).offset(0);
        make.centerY.mas_equalTo(buttonFullScreen.mas_centerY);
    }];
    _labelTimeTotal = labelTimeTotal;
    
    labelTimeTotal.textColor = kWhile;
    labelTimeTotal.text = @"00:88:00";
    
    UIButton *buttonPause = [UIButton pj_buttonWithSuperView:self constraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(50, 44));
        make.centerY.mas_equalTo(buttonFullScreen.mas_centerY);
    } touchUp:^(UIButton *sender) {
        [self buttonPausePlayFullScreen:sender];
    }];
    _buttonPause = buttonPause;
    
    [buttonPause setImage:[UIImage imageNamed:@"pauseButton"] forState:UIControlStateNormal];
    [buttonPause setImage:[UIImage imageNamed:@"playButton"] forState:UIControlStateSelected];

    PJLiveVideoProgressView *viewSlideProgress = [[PJLiveVideoProgressView alloc] init];
    [self addSubview:viewSlideProgress];
    
    viewSlideProgress.delegate = self;
    
    [viewSlideProgress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(buttonPause.mas_right).offset(55);
        make.right.mas_equalTo(self.mas_right).offset(-106);
        make.centerY.mas_equalTo(buttonFullScreen.mas_centerY);
    }];
    
    UILabel *labelTimeCurrent = [UILabel pj_labelWithFont:12 color:kWhile superView:self constraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(viewSlideProgress.mas_left).offset(-14);
        make.centerY.mas_equalTo(buttonPause.mas_centerY);
    }];
    _labelTimeCurrent = labelTimeCurrent;
    
    labelTimeCurrent.textColor = kWhile;
    labelTimeCurrent.text = @"00:18:28";
}

- (void)createPlayerFullScreenBottomView {
    UIView *viewFullScreenBottom = [UIView pj_viewWithSuperView:self color:[UIColor clearColor] constrains:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-5);
        make.height.mas_equalTo(30);
    }];
    _viewFullScreenBottom = viewFullScreenBottom;
    
    viewFullScreenBottom.hidden = YES;
    viewFullScreenBottom.backgroundColor = [UIColor clearColor];
    
    UIButton *buttonLast = [UIButton pj_buttonWithImage:@"lastButton" superView:viewFullScreenBottom constraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(viewFullScreenBottom.mas_left).offset(99);
        make.size.mas_equalTo(CGSizeMake(26, 26));
        make.centerY.mas_equalTo(viewFullScreenBottom.mas_centerY);
    } touchUp:^(UIButton *sender) {
        
    }];
    
    UIButton *buttonPauseFullScreen = [UIButton pj_buttonWithSuperView:viewFullScreenBottom constraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(buttonLast.mas_right).offset(0);
        make.size.mas_equalTo(CGSizeMake(26, 26));
        make.centerY.mas_equalTo(buttonLast.mas_centerY);
    } touchUp:^(UIButton *sender) {
        [self buttonPausePlayFullScreen:sender];
    }];
    _buttonPauseFullScreen = buttonPauseFullScreen;
    
    [buttonPauseFullScreen setImage:[UIImage imageNamed:@"pauseButton"] forState:UIControlStateNormal];
    [buttonPauseFullScreen setImage:[UIImage imageNamed:@"playButton"] forState:UIControlStateSelected];
    
    UIButton *buttonNext = [UIButton pj_buttonWithImage:@"nextButton" superView:viewFullScreenBottom constraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(buttonPauseFullScreen.mas_right).offset(0);
        make.size.mas_equalTo(CGSizeMake(26, 26));
        make.centerY.mas_equalTo(buttonLast.mas_centerY);
    } touchUp:^(UIButton *sender) {
        
    }];
    
    UIButton *buttonSelect = [UIButton pj_buttonWithSuperView:viewFullScreenBottom constraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(viewFullScreenBottom.mas_right).offset(-16);
        make.size.mas_equalTo(CGSizeMake(66, 30));
        make.centerY.mas_equalTo(viewFullScreenBottom.mas_centerY);
    } touchUp:^(UIButton *sender) {
        
    }];
    
    buttonSelect.titleLabel.font = KFontM(14);
    [buttonSelect setTitle:@"选集" forState:UIControlStateNormal];
    [buttonSelect setTitleColor:kWhile forState:UIControlStateNormal];
    
    UIButton *buttonArticulation = [UIButton pj_buttonWithSuperView:viewFullScreenBottom constraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(buttonSelect.mas_left).offset(-6);
        make.size.mas_equalTo(CGSizeMake(66, 30));
        make.centerY.mas_equalTo(buttonSelect.mas_centerY);
    } touchUp:^(UIButton *sender) {
        
    }];
    
    buttonArticulation.titleLabel.font = KFontM(14);
    [buttonArticulation setTitle:@"清晰" forState:UIControlStateNormal];
    [buttonArticulation setTitleColor:kWhile forState:UIControlStateNormal];
    
    UIButton *buttonRate = [UIButton pj_buttonWithSuperView:viewFullScreenBottom constraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(buttonArticulation.mas_left).offset(-6);
        make.size.mas_equalTo(CGSizeMake(66, 30));
        make.centerY.mas_equalTo(buttonArticulation.mas_centerY);
    } touchUp:^(UIButton *sender) {
        
    }];
    
    buttonRate.titleLabel.font = KFontM(14);
    [buttonRate setTitle:@"倍速x1.0" forState:UIControlStateNormal];
    [buttonRate setTitleColor:kWhile forState:UIControlStateNormal];
}

- (void)controlBackAction {
    
    if (self.isFullScreen) {
        [self smallScreenTransformation];
    } else {
        // 直接返回
    }
}

- (void)buttonPausePlayFullScreen:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        [self.playerHandle pause];
    } else {
        [self.playerHandle play];
    }
}

- (void)smallFullScreenTransformation:(BOOL)isScreen {
    
    if (isScreen) {
        [self fullScreenTransformation];
        [self fullScreenStatusChange];
    } else {
        [self smallScreenTransformation];
        [self smallScreenStatusChange];
    }
}

- (void)fullScreenTransformation {
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationLandscapeLeft] forKey:@"orientation"];
}

- (void)smallScreenTransformation {
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];
}

- (void)fullScreenStatusChange {
    self.isFullScreen = YES;
}

- (void)smallScreenStatusChange {
    self.isFullScreen = NO;
}

- (void)screenStatusChangeLayoutAdjust:(BOOL)isFullScreen {
    
    self.buttonPause.hidden = isFullScreen;
    self.viewFullScreenBottom.hidden = !isFullScreen;
    self.buttonSetterFloatLayer.hidden = !isFullScreen;
    
    if (isFullScreen) {
        [self fullScreenLayoutAdjust];
    } else {
        [self smallScreenLayoutAdjust];
    }
    
    if (isFullScreen) {
        self.buttonPauseFullScreen.selected = self.buttonPause.isSelected;
    } else {
        self.buttonPause.selected = self.buttonPauseFullScreen.isSelected;
    }
}

- (void)fullScreenLayoutAdjust {
    
    [self.viewSlideProgress mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.buttonPause.mas_right).offset(22);
    }];
    
    [self.buttonFullScreen mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).offset(-30);
    }];
}

- (void)smallScreenLayoutAdjust {
    
    [self.viewSlideProgress mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.buttonPause.mas_right).offset(63);
    }];
    
    [self.buttonFullScreen mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
}

- (void)controlSetterFloatLayerAction {
    
}

#pragma mark - PJPlayerHandleDelegate
- (void)PJPlayerHandle:(PJBasePlayer *)player TotalTime:(CGFloat)time {
    if (time <= 0.0) {
        time = 1.0;
    }
    
    totalTime = time;
    self.labelTimeTotal.text = [NSString formatSecondsToString:time];
}

- (void)PJPlayerHandle:(PJBasePlayer *)player CurrentTime:(CGFloat)time {
    self.labelTimeCurrent.text = [NSString formatSecondsToString:time];
    self.viewSlideProgress.viewSlider.value = time/totalTime;
}

- (void)PJPlayerHandle:(PJBasePlayer *)player LoadTime:(CGFloat)time {
//    NSLog(@"LoadTime= %f", time);

    self.viewSlideProgress.cacheProgressValue = time/totalTime;
}

#pragma mark - PJLiveVideoProgressViewDelegate
- (void)PJLiveVideoProgressViewSliderBegin {
    if (self.playerHandle.isPlaying) {
        [self.playerHandle.player pause];
    }
}

- (void)PJLiveVideoProgressViewSliderMoving:(PJLiveVideoSlider *)slider {
    self.labelTimeCurrent.text = [NSString formatSecondsToString:slider.value * totalTime];
}

- (void)PJLiveVideoProgressViewSliderEnd:(PJLiveVideoSlider *)slider {
    if (self.playerHandle.player.status != AVPlayerStatusReadyToPlay) {
        return;
    }

    CMTime dragedCMTime = CMTimeMakeWithSeconds(totalTime * slider.value, 1000);
    [self.playerHandle.player seekToTime:dragedCMTime toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero completionHandler:^(BOOL finished) {
        if (finished) {
            [self.playerHandle.player play];
        }
    }];
}

#pragma mark - 外部方法
- (void)playWithVideoUrl:(NSString *)videoUrl {
    [self.playerHandle stop];
    
    self.playerHandle.playUrl = videoUrl;
    
    if ([self.layer.sublayers containsObject:self.playerHandle.playerLayer]) {
       
        [self.playerHandle nextWithUrl:videoUrl];
        
        [self.playerHandle play];
    }
}

#pragma mark - 观察者
- (void)addObserver {
    [self addObserver:self forKeyPath:@"isFullScreen" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    StartLog(@"%@, %@", object, keyPath);
    
    NSString *strIsFullScreen = [change objectForKey:NSKeyValueChangeNewKey];
    [self screenStatusChangeLayoutAdjust:strIsFullScreen.intValue];
}

#pragma mark - 懒加载方法
-(PJPlayerHandle *)playerHandle {
    if (!_playerHandle) {
        _playerHandle = [[PJPlayerHandle alloc] init];
        _playerHandle.delegate = self;
    }
    return _playerHandle;
}

@end
