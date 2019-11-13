//
//  PJPlayerHandle.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/7.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJPlayerHandle.h"

@interface PJPlayerHandle ()

@property (nonatomic,strong) id playerTimeObserver; //!< player 时间监听

@end

@implementation PJPlayerHandle

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //1. 播放器配置
        [self initParamConfig];
        
        //2. 创建布局控件
        [self createContainerControl];
    }
    return self;
}

#pragma mark - 外部方法初始化
- (instancetype)initWithUrl:(NSString *)url {
    
    self = [super init];
    if (self) {
        [self nextWithUrl:url];
    }
    return self;
}

- (void)nextWithUrl:(NSString *)url {

    if (!url) return;
    
    self.playUrl = url;
    
    //1. 暂停上一个视频播放 处理
    [self previousVideoProcessing];
    
    //2. url有效性检测
    NSURL *videoUrl = [self videoUrlEffecVerWithUrl:url];
    
    //3. 重新设置_player 播放器
    [self reSetPlayerVideoWith:videoUrl];
    
    //4. 添加通知
    [self addNotification];
    
    [self swithPlayerStatus];
}

- (void)play {
    
    if (!_isPlaying) {
        if (!_playerItemStatus) {
            [self nextWithUrl:_playUrl];
        }
        
        [_player play];
        
        _isPlaying = YES;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(PJPlayerHandle:State:)]) {
            [self.delegate PJPlayerHandle:_player State:PJPlayerHandleStatePlaying];
        }
    }
}

- (void)pause {
    
    if (_isPlaying) {
        _isPlaying = NO;
        
        [_player pause];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(PJPlayerHandle:State:)]) {
            [self.delegate PJPlayerHandle:_player State:PJPlayerHandleStatePause];
        }
    }
}

- (void)stop {
    
    _isPlaying = NO;
    [_player pause];
    
    [self removeTimeObserver];
    
    if (_playerItemStatus) {
        [self removeNotification];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(PJPlayerHandle:State:)]) {
        [self.delegate PJPlayerHandle:_player State:PJPlayerHandleStateStop];
    }
}

#pragma mark - 内部方法初始化
- (void)reSetPlayerVideoWith:(NSURL *)url {
    _playerItemStatus = [PJBasePlayerItem playerItemWithURL:url];
    [_player replaceCurrentItemWithPlayerItem:_playerItemStatus];
}

- (NSURL *)videoUrlEffecVerWithUrl:(NSString *)urlStr {
    
    NSURL *videoUrl = [NSURL fileURLWithPath:urlStr];
    if ([urlStr containsString:@"http"]) {
        videoUrl = [self translateIllegalCharacterWtihUrlStr:urlStr];
    }
    
    return videoUrl;
}

- (void)previousVideoProcessing {
    [_player pause];
    
    [self removeTimeObserver];
    
    if (_playerItemStatus) {
        [self removeNotification];
        _playerItemStatus = nil;
    }
}

- (void)swithPlayerStatus {
    _player.rate=1.0;
    
    if (_isPlaying) {
        [_player play];
    }else {
        [_player pause];
    }
}

- (NSURL *)translateIllegalCharacterWtihUrlStr:(NSString *)oldUrl{
    oldUrl = [oldUrl stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *encodedString = [oldUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    [oldUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    return [NSURL URLWithString:encodedString];
}

// 获取音视频时间
- (void)getVideoPlayerTimer {
    
    CGFloat timeInterval = CMTimeGetSeconds(self.playerItemStatus.asset.duration);
    if (self.delegate && [self.delegate respondsToSelector:@selector(PJPlayerHandle:TotalTime:)]) {
        [self.delegate PJPlayerHandle:_player TotalTime:timeInterval];
    }
    
    [self removeTimeObserver];
    
    __weak typeof(self) weakSelf = self;
    self.playerTimeObserver = [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 10) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
       
        if (weakSelf.isPlaying) {
            CGFloat currentTime = CMTimeGetSeconds(time);
            if (self.delegate && [self.delegate respondsToSelector:@selector(PJPlayerHandle:CurrentTime:)]) {
                [weakSelf.delegate PJPlayerHandle:weakSelf.player CurrentTime:currentTime];
            }
        }
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (object == _playerItemStatus) {
        
        if ([keyPath isEqualToString:@"status"]) {
            
            if (_playerItemStatus.status == AVPlayerStatusReadyToPlay) {
                
                [self getVideoPlayerTimer];
                
                if (self.delegate && [self.delegate respondsToSelector:@selector(PJPlayerHandle:State:)]) {
                    [self.delegate PJPlayerHandle:_player State:PJPlayerHandleStateReadyToPlay];
                }
            } else if (_playerItemStatus.status == AVPlayerStatusFailed) {
                       if (self.delegate && [self.delegate respondsToSelector:@selector(PJPlayerHandle:State:)]) {
                           [self.delegate PJPlayerHandle:_player State:PJPlayerHandleStateFailed];
                       }
                       
                       [self stop];
                   }
            
            AVPlayerItemStatus status = AVPlayerItemStatusUnknown;
            // Get the status change from the change dictionary
            NSNumber *statusNumber = change[NSKeyValueChangeNewKey];
            if ([statusNumber isKindOfClass:[NSNumber class]]) {
                status = statusNumber.integerValue;
            }
            // Switch over the status
            switch (status) {
                case AVPlayerItemStatusReadyToPlay:
                    // Ready to Play
                    break;
                case AVPlayerItemStatusFailed:
                    // Failed. Examine AVPlayerItem.error
                    break;
                case AVPlayerItemStatusUnknown:
                    // Not ready
                    break;
            }
        } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
                                              
            CMTimeRange range = [_playerItemStatus.loadedTimeRanges.firstObject CMTimeRangeValue];
            CGFloat loadSeconds = CMTimeGetSeconds(range.start) + CMTimeGetSeconds(range.duration);
            if (self.delegate && [self.delegate respondsToSelector:@selector(PJPlayerHandle:LoadTime:)]) {
                [self.delegate PJPlayerHandle:_player LoadTime:loadSeconds];
            }
        } else if ([keyPath isEqualToString:@"playbackBufferEmpty"]) {
            
        } else if ([keyPath isEqualToString:@"playbackLikelyToKeepUp"]) {
            
            if (!_playerItemStatus.playbackLikelyToKeepUp) {
                _isBuffering = YES;
            } else {
                _isBuffering = NO;
            }
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(PJPlayerHandle:State:)]) {
                [self.delegate PJPlayerHandle:_player State:_isBuffering?PJPlayerHandleStateBufferEmpty:PJPlayerHandleStateKeepUp];
            }
        }
    }
}

#pragma mark - 添加通知
- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayFailedEnd:) name:AVPlayerItemFailedToPlayToEndTimeNotification object:_playerItemStatus]; // AVPlayer播放失败通知
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayStalledEnd:) name:AVPlayerItemPlaybackStalledNotification object:_playerItemStatus]; // AVPlayer播放中断通知
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:_playerItemStatus]; // AVPlayer播放完成通知
    
    [_playerItemStatus addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil]; // 监听播放状态
    
    [_playerItemStatus addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil]; // 监听loadedTimeRanges属性

    [_playerItemStatus addObserver:self forKeyPath:@"playbackBufferEmpty" options:NSKeyValueObservingOptionNew context:nil];

    [_playerItemStatus addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeTimeObserver {
    
    if (_playerTimeObserver) {
        [_player removeTimeObserver:_playerTimeObserver];
        _playerTimeObserver = nil;
    }
}

// 移除通知
- (void)removeNotification {
    [_playerItemStatus removeObserver:self forKeyPath:@"status"];
    [_playerItemStatus removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [_playerItemStatus removeObserver:self forKeyPath:@"playbackBufferEmpty"];
    [_playerItemStatus removeObserver:self forKeyPath:@"playbackLikelyToKeepUp"];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:_playerItemStatus];
}

#pragma mark - 播放器配置
- (void)initParamConfig {
    
    _isPlaying = NO;
    _isBuffering = NO;
    
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: nil];
}

- (void)moviePlayDidEnd:(NSNotification *)noti {
    [self.player seekToTime:kCMTimeZero];
    
    _isPlaying = NO;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(PJPlayerHandle:State:)]) {
        [self.delegate PJPlayerHandle:_player State:PJPlayerHandleStateStop];
    }
}

- (void)moviePlayFailedEnd:(NSNotification *)noti {
    
}

- (void)moviePlayStalledEnd:(NSNotification *)noti {
    
}

#pragma mark - 创建布局控件
- (void)createContainerControl {
    self.player = [[PJBasePlayer alloc] initWithPlayerItem:_playerItemStatus];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill; 
    self.playerLayer.backgroundColor = [UIColor clearColor].CGColor;
}

#pragma mark - dealloc
-(void)dealloc {
    
    [self removeNotification];
    
    // 恢复其他音频
    [[AVAudioSession sharedInstance] setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
}

@end
