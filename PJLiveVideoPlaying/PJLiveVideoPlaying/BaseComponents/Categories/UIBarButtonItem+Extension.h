//
//  UIBarButtonItem+Extension.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/6.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Extension)

+(UIBarButtonItem *)itemBack;

+(UIBarButtonItem *)itemBackTarget:(id)target action:(SEL)action;

+(UIBarButtonItem *)itemBackTitle:(NSString *)title Target:(id)target action:(SEL)action;

+(UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

+(UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName insets:(UIEdgeInsets)insets target:(id)target action:(SEL)action;



@end

NS_ASSUME_NONNULL_END
