//
//  PJLiveVideoSDWebImageController.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/24.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJLiveVideoSDWebImageController.h"

@interface PJLiveVideoSDWebImageController ()

@end

@implementation PJLiveVideoSDWebImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 播放器配置
    [self initParamConfig];
    
    //2. 创建主视图
    [self createContainerView];
}

#pragma mark - Private
- (void)initParamConfig {
    
}

- (void)createContainerView {
    
    UIButton *btn = [[UIButton alloc] init];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(140, 180));
        
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(20);
        } else {
            make.top.mas_equalTo(self.view.mas_top).offset(20);
        }
    }];

    [btn sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1574423747835&di=27a498c183392df2937b208e27a533a9&imgtype=0&src=http%3A%2F%2Fp0.ifengimg.com%2Fpmop%2F2018%2F0109%2F446268C9FA00802C3B5BD2F78A81EE15431918CC_size63_w1024_h1280.jpeg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
    
    
    UIButton *btn2 = [[UIButton alloc] init];
    [self.view addSubview:btn2];
    
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {

        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(160, 180));
        
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(20);
        } else {
            make.top.mas_equalTo(self.view.mas_top).offset(20);
        }
    }];

    [btn2 sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1574577724465&di=54c6f7fce2ecd5064d290108eae016aa&imgtype=0&src=http%3A%2F%2Fimage.ixinwei.com%2Fxinwei201611%2Fa71272.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
}

@end
