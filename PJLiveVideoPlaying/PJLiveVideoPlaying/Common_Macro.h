//
//  Common_Macro.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/6.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#ifndef Common_Macro_h
#define Common_Macro_h

#ifdef DEBUG
#   define StartLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define TRTLog(...)
#endif

#define IPHONE_X ({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

// 宽, 高
#define kWIDTH [[UIScreen mainScreen] bounds].size.width
#define kHEIGHT [[UIScreen mainScreen] bounds].size.height

// 系统导航栏高度
//#define NavAllH        (44 + StatusRectH)
//
#define StatusRectH     [[UIApplication sharedApplication] statusBarFrame].size.height

//#define StatusRectH     (IPHONE_X == 1) ? 44:20

#endif /* Common_Macro_h */
