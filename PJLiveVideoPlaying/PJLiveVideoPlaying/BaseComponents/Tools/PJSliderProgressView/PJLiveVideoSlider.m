//
//  PJLiveVideoSlider.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/11.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJLiveVideoSlider.h"

@implementation PJLiveVideoSlider

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //1. 参数初始化
        [self initParamConfig];
    }
    return self;
}

- (void)initParamConfig {
    
    [self setThumbImage:[UIImage imageNamed:@"player-slider_spot"] forState:UIControlStateNormal];
    self.minimumTrackTintColor = [UIColor colorWithWhite:1 alpha:0.6];
    self.maximumTrackTintColor = [UIColor clearColor];
    
}

@end
