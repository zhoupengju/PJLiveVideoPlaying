//
//  PJLiveVideoMainTabBarManger.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/6.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "PJLiveVideoMyController.h"
#import "PJVideoPlayingController.h"
#import "PJNavigationBaseController.h"
#import "PJLiveVideoMainTabBarManger.h"

@implementation PJLiveVideoMainTabBarManger

-(PJTabBarBaseController *)settingTabBar {
    
    PJTabBarBaseController *tabbar = [[PJTabBarBaseController alloc] init];

//    [tabbar.tabBar setTintColor:kTabBarNormal];
//    [tabbar.tabBar setBarTintColor:kTabBarNormal];
//
//    UIImage* tabBarBackground = [UIImage imageWithColor:kWhile withFrame:CGRectMake(0, 0, StarWIDTH, StatusRectH)];
//    [[UITabBar appearance] setBackgroundImage:[tabBarBackground resizableImageWithCapInsets:UIEdgeInsetsZero]];
    
    UITabBarItem *items1 = [self createTabBar:1 withString:@"视频"];
    PJNavigationBaseController *nav1 = [[PJNavigationBaseController alloc] initWithRootViewController:[[PJVideoPlayingController alloc] init]];
    nav1.tabBarItem = items1;
    
    UITabBarItem *items4 = [self createTabBar:4 withString:@"个人中心"];
    PJNavigationBaseController *nav4 = [[PJNavigationBaseController alloc] initWithRootViewController:[[PJLiveVideoMyController alloc] init]];
    nav4.tabBarItem = items4;
    
    tabbar.viewControllers = @[nav1, nav4];
    
    return tabbar;
}

- (UITabBarItem *)createTabBar:(int)type withString:(NSString *)title {
   
    UIImage *selectedImage=[UIImage imageNamed:[NSString stringWithFormat:@"iosxx_%d_on",type]];
    UIImage * originImage=[UIImage imageNamed:[NSString stringWithFormat:@"iosxx_%d",type]];
    
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    originImage = [originImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *item =[[UITabBarItem alloc] initWithTitle:title image:originImage selectedImage:selectedImage ];
    
    return item;
}

@end
