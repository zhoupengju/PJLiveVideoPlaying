//
//  PJLiveVideoMyController.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/6.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "SJVideoPlayer.h"
#import "PJLiveVideoMyController.h"
#import "SJIJKMediaPlaybackController.h"

#define SourceStr @"https://xy2.v.netease.com/r/video/20190814/7db8102c-1b18-4a59-ac70-ec03137f1c2e.mp4"

@interface PJLiveVideoMyController ()

@property (nonatomic, strong) SJVideoPlayer *player;

@end

@implementation PJLiveVideoMyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SJVideoPlayer *player = [SJVideoPlayer player];
    _player = player;
    [self.view addSubview:player.view];
    
//    _player.playbackController = SJIJKMediaPlaybackController.new;

    _player.URLAsset = [[SJVideoPlayerURLAsset alloc] initWithURL:[NSURL URLWithString:SourceStr]];
    
    [player.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(viewPlayerContentH);

        if (IPHONE_X) {
            if (@available(iOS 11.0, *)) {
                make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            } else {
                make.top.mas_equalTo(self.view);
            }
        } else {
            make.top.mas_equalTo(self.view);
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

@end
