
//
//  PJSDKIntegrationManger.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/10.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJSDKIntegrationManger.h"

@implementation PJSDKIntegrationManger

#pragma mark - 第三方SDK集成入口
- (void)makeThirdIntegration {

    //1. 友盟
    [self uShareIntegration];
    
    //2. 百度地图
    
    //3. 极光推送
}

#pragma mark - UIApplicationDelegate - 代理方法 方便类似<极光推送的集成>, 给appdelegate减负
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 第三方SDK
- (void)uShareIntegration {
    
}

@end
