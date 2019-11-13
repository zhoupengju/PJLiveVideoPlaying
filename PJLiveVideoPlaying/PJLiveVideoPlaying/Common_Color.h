//
//  Common_Color.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/6.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#ifndef Common_Color_h
#define Common_Color_h

// 全局颜色
#define kRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0f]
#define kRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define kRGBColor(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#define kWhile kRGB(255,255,255)
#define kSlidingGlobal kRGB(228, 228, 228)
#define kNotarizationText kRGBColor(0x999999)
#define kGlableBg kRGB(245,245,245)
#define kGlableLine kRGB(230,230,230)

#define kGlobal3 kRGBColor(0x333333)
#define kGlobal4 kRGBColor(0x444444)
#define kGlobal6 kRGBColor(0x666666)
#define kGlobal89 kRGBColor(0x898989)
#define kGlobal9 kRGBColor(0x999999)
#define kGlobalB5 kRGBColor(0xB5B5B5)
#define kGlobal11 kRGBColor(0xBcBcBc)
#define kGlobal12 kRGBColor(0xcccccc)
#define kGlobal14 kRGBColor(0xeeeeee)
#define kGlobalBlue kRGBColor(0x0ea3f0)

#define kUploadProgress kRGBColor(0x0EA3F0)

#define kTabBarNormal kRGB(181,181,181)
#define kTabBarSelect kRGB(255,255,255)

// 随机色
#define PJRandomColor PJColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// 全局字体
#define KFontR(Size) [UIFont fontWithName:@"PingFang-SC-Regular" size:Size]
#define KFontM(Size) [UIFont fontWithName:@"PingFang-SC-Medium" size:Size]
#define KFontL(Size) [UIFont fontWithName:@"PingFang-SC-Light" size:Size]
#define KFontGlable(Size) [UIFont systemFontOfSize:Size]

#endif /* Common_Color_h */
