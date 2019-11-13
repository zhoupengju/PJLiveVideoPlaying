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
    
    self.value = 0.0f;
    self.continuous = NO; 
    self.minimumValue = 0.0f;
    self.maximumValue = 1.0f;
    
    [self setMaximumTrackImage:[UIImage imageWithColor:[UIColor clearColor] withFrame:CGRectMake(0, 0, kWIDTH, kPlayProgressBarHeight)] forState:UIControlStateNormal];

    [self setMinimumTrackImage:[UIImage imageNamed:@"slider"] forState:UIControlStateNormal];
    
    [self setThumbImage:[UIImage imageNamed:@"player-slider-handle"] forState:UIControlStateNormal];
    
}

-(CGRect)trackRectForBounds:(CGRect)bounds{
    return CGRectMake(2, (bounds.size.height-kPlayProgressBarHeight)*0.5-0.25, bounds.size.width, kPlayProgressBarHeight);
}

@end
