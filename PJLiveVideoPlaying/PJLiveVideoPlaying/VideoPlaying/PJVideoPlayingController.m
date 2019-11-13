//
//  PJVideoPlayingController.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/6.
//  Copyright © 2019 zhoupengju. All rights reserved.
//


#import "PJVideoPlayingController.h"

#define SourceURL [NSURL URLWithString:@"https://xy2.v.netease.com/r/video/20190814/7db8102c-1b18-4a59-ac70-ec03137f1c2e.mp4"]

#define SourceStr @"https://xy2.v.netease.com/r/video/20190814/7db8102c-1b18-4a59-ac70-ec03137f1c2e.mp4"

#define SourceURL1 @"https://crazynote.v.netease.com/2019/0811/6bc0a084ee8655bfb2fa31757a0570f4qt.mp4"

@interface PJVideoPlayingController ()

@end

@implementation PJVideoPlayingController

- (void)viewDidLoad {
    [super viewDidLoad];

    PJPlayerContentView *viewPlayerContent = [[PJPlayerContentView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, viewPlayerContentH)];
    _viewPlayerContent = viewPlayerContent;
    [self.view addSubview:viewPlayerContent];

    [viewPlayerContent mas_makeConstraints:^(MASConstraintMaker *make) {
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

    [viewPlayerContent playWithVideoUrl:SourceStr];
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
