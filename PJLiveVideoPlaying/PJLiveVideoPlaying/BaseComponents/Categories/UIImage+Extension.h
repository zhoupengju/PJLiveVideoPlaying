//
//  UIImage+Extension.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/6.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

//返回一张可以自由拉伸的图片
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

//使用传入的颜色返回一张此颜色的照片
+ (UIImage *)imageWithColor:(UIColor *)color;

+(UIImage *)imageWithColor:(UIColor *)color withFrame:(CGRect)rect;

//图片压缩到指定大小
+ (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize andSourceImage:(UIImage *)sourceImage;

+ (UIImage *)fixOrientation:(UIImage *)aImage;

+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


@end

NS_ASSUME_NONNULL_END
