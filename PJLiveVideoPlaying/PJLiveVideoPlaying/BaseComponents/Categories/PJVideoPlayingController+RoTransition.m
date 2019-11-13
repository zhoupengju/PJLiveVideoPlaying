//
//  PJVideoPlayingController+RoTransition.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/7.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJVideoPlayingController+RoTransition.h"

@implementation PJVideoPlayingController (RoTransition)

#pragma mark - 屏幕旋转
//是否自动旋转,返回YES可以自动旋转
- (BOOL)shouldAutorotate {
    return YES;
}
//返回支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}
//这个是返回优先方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

// 全屏需要重写方法
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator  {
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    if (orientation == UIDeviceOrientationPortrait || orientation
        == UIDeviceOrientationPortraitUpsideDown) {

        self.tabBarController.tabBar.hidden = NO;
        [UIApplication sharedApplication].statusBarHidden = NO;
        
        [self.viewPlayerContent mas_remakeConstraints:^(MASConstraintMaker *make) {
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
        
        [self.viewPlayerContent smallScreenStatusChange];
    }else {
        
        self.tabBarController.tabBar.hidden = YES;
        [UIApplication sharedApplication].statusBarHidden = YES;
        
        [self.viewPlayerContent mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
        
        [self.viewPlayerContent fullScreenStatusChange];
    }
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

@end
