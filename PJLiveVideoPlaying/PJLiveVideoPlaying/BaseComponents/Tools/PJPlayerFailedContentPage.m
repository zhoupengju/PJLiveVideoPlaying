//
//  PJPlayerFailedContentPage.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/14.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJPlayerFailedContentPage.h"

@implementation PJPlayerFailedContentPage

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
    
}

- (void)createContainerView {
    
    UILabel *labelTips = [UILabel pj_labelWithText:@"视频加载失败, 请稍后重试" font:16 color:kWhile Direction:NSTextAlignmentCenter superView:self constraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(-20);
        make.centerX.mas_equalTo(self.mas_centerX);
    } onTaped:^(UITapGestureRecognizer *sender) {
        
    }];
    
    UIButton *buttonTipsRetry = [UIButton pj_buttonWithSuperView:self constraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(20);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    } touchUp:^(UIButton *sender) {
        [self buttonTipsRetry];
    }];
    
    buttonTipsRetry.layer.cornerRadius = 16;
    buttonTipsRetry.backgroundColor = kGlobal4;
    buttonTipsRetry.titleLabel.font = KFontM(16);
    [buttonTipsRetry setTitle:@"点击重试" forState:UIControlStateNormal];
    [buttonTipsRetry setTitleColor:kWhile forState:UIControlStateNormal];
}

- (void)buttonTipsRetry {
    if (self.playerFailedContentPageRetry) {
        self.playerFailedContentPageRetry(1);
    }
}

@end
