//
//  PJMainPageManger.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/10.
//  Copyright © 2019 zhoupengju. All rights reserved.
//  负责整个app的启动界面管理

#import <Foundation/Foundation.h>

@class AppDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface PJMainPageManger : NSObject

@property(nonatomic, weak) AppDelegate *appdelegate;

- (void)makeMainPage;

@end

NS_ASSUME_NONNULL_END
