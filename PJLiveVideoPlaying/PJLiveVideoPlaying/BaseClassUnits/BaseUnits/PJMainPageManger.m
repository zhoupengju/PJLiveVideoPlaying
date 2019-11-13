//
//  PJMainPageManger.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/10.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "AppDelegate.h"
#import "PJMainPageManger.h"
#import "PJLiveVideoMainTabBarManger.h"
#import "PJTabBarBaseController.h"
#import "PJNavigationBaseController.h"
#import "PJLiveVideoPlayingGuideController.h"

@implementation PJMainPageManger

#pragma mark - 主界面管理
- (void)makeMainPage {
    
    //1. 创建 window
    self.appdelegate.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.appdelegate.window.backgroundColor = [UIColor whiteColor];
    
    //2. 主界面启动逻辑管理
    [self mainPageStartLogicManger];
    
    [self.appdelegate.window makeKeyAndVisible];
}

#pragma mark - 主界面启动逻辑管理 备注: 有引导页面的逻辑
- (void)mainPageStartLogicManger {

//    if ([CommonStatusValueManager sharedManager].isFistStartMainPage) {
//        [self mainPageTabBarManger];
//    } else{
//        [self systemGuidePageLogicManger];
//    }

    [self mainPageTabBarManger];
}

//- (void)systemGuidePageLogicManger {
//
//    PJLiveVideoPlayingGuideController *vc = [[PJLiveVideoPlayingGuideController alloc] init];
//    self.appdelegate.window.rootViewController = vc;
//
//    vc.pushMainVc = ^() {
//        [self mainPageTabBarManger];
//    };
//}
//
- (void)mainPageTabBarManger {

    PJLiveVideoMainTabBarManger *tabBarManger = [[PJLiveVideoMainTabBarManger alloc] init];
    PJTabBarBaseController *tabBarVc = [tabBarManger settingTabBar];
    self.appdelegate.window.rootViewController = tabBarVc;
}

@end
