//
//  UILabel+PJMasonryKit.h
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (PJMasonryKit)

+ (instancetype)pj_labelWithFont:(CGFloat)font;

+ (instancetype)pj_labelWithText:(NSString *)text
                             font:(CGFloat)font;

+ (instancetype)pj_labelWithFont:(CGFloat)font
                        superView:(UIView *)superView
                      constraints:(PJConstraintMaker)constraints;

+ (instancetype)pj_labelWithFont:(CGFloat)font color:(UIColor *)color 
                       superView:(UIView *)superView
                     constraints:(PJConstraintMaker)constraints;

+(instancetype)pj_labelWithFont:(CGFloat)font Direction:(NSTextAlignment)direction superView:(UIView *)superView constraints:(PJConstraintMaker)constraints;

+ (instancetype)pj_labelWithText:(NSString *)text
                             font:(CGFloat)font
                        superView:(UIView *)superView
                      constraints:(PJConstraintMaker)constraints;

+ (instancetype)pj_labelWithText:(NSString *)text
                             font:(CGFloat)font
                            lines:(NSInteger)lines
                        superView:(UIView *)superView
                      constraints:(PJConstraintMaker)constraints;

+(instancetype)pj_labelWithText:(NSString *)text font:(CGFloat)font IsBold:(BOOL)isBold color:(UIColor *)color Direction:(NSTextAlignment)direction lines:(NSInteger)lines superView:(UIView *)superView constraints:(PJConstraintMaker)constraints;

+(instancetype)pj_labelWithText:(NSString *)text font:(CGFloat)font color:(UIColor *)color Direction:(NSTextAlignment)direction superView:(UIView *)superView constraints:(PJConstraintMaker)constraints onTaped:(PJTapGestureBlock)onTaped;


@end
