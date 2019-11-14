//
//  PJPlayerHandle.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/7.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJBasePlayer.h"
#import "PJBasePlayerItem.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PJPlayerHandleState) {
    PJPlayerHandleStateReadyToPlay, // 播放器准备完毕
    PJPlayerHandleStatePlaying, // 正在播放
    PJPlayerHandleStatePause, // 暂停
    PJPlayerHandleStateStop, // 播放完毕
    PJPlayerHandleStateBufferEmpty, // 缓冲中
    PJPlayerHandleStateKeepUp, // 缓冲完成
    PJPlayerHandleStateFailed, // 播放器准备失败、网络原因，格式原因
};

@protocol PJPlayerHandleDelegate <NSObject>

@optional
// 播放器状态变化
- (void)PJPlayerHandle:(PJBasePlayer *)palyer State:(PJPlayerHandleState)state;

// 返回视频的总长度
- (void)PJPlayerHandle:(PJBasePlayer *)player TotalTime:(CGFloat)time;

// 返回视频的缓冲长度
- (void)PJPlayerHandle:(PJBasePlayer *)player LoadTime:(CGFloat)time;

// 播放时调用，返回当前时间
- (void)PJPlayerHandle:(PJBasePlayer *)player CurrentTime:(CGFloat)time;

@end

@interface PJPlayerHandle : NSObject

// 使用播放源相关方法
- (instancetype)initWithUrl:(NSString *)url;

- (void)nextWithUrl:(NSString *)url;//!< 下一首

- (void)play;   //!< 播放

- (void)pause;  //!< 暂停

- (void)stop;   //!< 停止

@property (nonatomic, weak) id<PJPlayerHandleDelegate> delegate;

@property (nonatomic, copy) NSString *playUrl;

@property (nonatomic, assign) BOOL isPlaying; //!< 是否正在播放

@property (nonatomic, assign, readonly) BOOL isBuffering;//!< 是否在缓冲

// 播放器相关
@property (nonatomic, strong) PJBasePlayer *player;
@property (nonatomic, strong) PJBasePlayerItem *playerItemStatus;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

@end

NS_ASSUME_NONNULL_END
