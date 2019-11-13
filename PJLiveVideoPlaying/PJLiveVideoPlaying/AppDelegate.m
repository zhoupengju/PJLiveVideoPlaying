//
//  AppDelegate.m
//  面试题测试Test
//
//  Created by 周鹏钜 on 2019/9/22.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "AppDelegate.h"
#import "PJMainPageManger.h"
#import "PJSDKIntegrationManger.h"

@interface AppDelegate ()

@property (nonatomic, strong) PJMainPageManger *mangerMainPage; //!<负责主界面管理
@property (nonatomic, strong) PJSDKIntegrationManger *mangerSDK; //!<负责第三方SDK的集成管理

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //1.主界面管理
    [self makeMainPageManger];
    [self.mangerMainPage makeMainPage];
    
    //2.第三方SDK集成管理类
    [self makeAppStartingThirdIntegrationManger];
    [self.mangerSDK makeThirdIntegration];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self.mangerSDK applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.mangerSDK applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self.mangerSDK applicationWillEnterForeground:application];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self.mangerSDK applicationDidBecomeActive:application];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [self.mangerSDK applicationWillTerminate:application];
}

#pragma mark - 界面管理
- (void)makeMainPageManger {
    _mangerMainPage = [[PJMainPageManger alloc] init];
    _mangerMainPage.appdelegate = self;
}

#pragma mark - App启动时第三方SDK管理
- (void)makeAppStartingThirdIntegrationManger {
    _mangerSDK = [[PJSDKIntegrationManger alloc] init];
}



@end
