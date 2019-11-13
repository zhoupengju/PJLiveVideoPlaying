//
//  UIButton+PJHelperBlocksKit.h
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (PJHelperBlocksKit)

+ (instancetype)pj_buttonWithTouchUp:(PJButtonBlock)onTouchUp;

+ (instancetype)pj_buttonWithSuperView:(UIView *)superView
                           constraints:(PJConstraintMaker)constraints
                               touchUp:(PJButtonBlock)touchUp;

+ (instancetype)pj_buttonWithSuperView:(UIView *)superView
                              withFont:(UIFont *)font color:(UIColor *)color
                           constraints:(PJConstraintMaker)constraints
                               touchUp:(PJButtonBlock)touchUp;

+ (instancetype)PJ_buttonWithTitle:(NSString *)title
                         superView:(UIView *)superView
                       constraints:(PJConstraintMaker)constraints
                           touchUp:(PJButtonBlock)touchUp;

+ (instancetype)pj_buttonWithImage:(id)image
                         superView:(UIView *)superView
                       constraints:(PJConstraintMaker)constraints
                           touchUp:(PJButtonBlock)touchUp;

+ (instancetype)pj_buttonWithImage:(id)image
                     selectedImage:(id)selectedImage
                         superView:(UIView *)superView
                       constraints:(PJConstraintMaker)constraints
                           touchUp:(PJButtonBlock)touchUp;

+ (instancetype)pj_buttonWithTitle:(NSString *)title
                          withFont:(UIFont *)font
                             color:(UIColor *)color
                           bgImage:(id)bgImage
                         superView:(UIView *)superView
                       constraints:(PJConstraintMaker)constaints
                           touchUp:(PJButtonBlock)touchUp;

+(instancetype)pj_buttonWithSuperView:(UIView *)superView
                                Title:(NSString *)title withFont:(UIFont *)font TitleColor:(UIColor *)titleColor
                          BorderColor:(UIColor *)borderColor constraints:(PJConstraintMaker)constraints touchUp:(PJButtonBlock)touchUp; //!< 订单

+(instancetype)pj_buttonWithSuperView:(UIView *)superView
                                Title:(NSString *)title withFont:(UIFont *)font TitleColor:(UIColor *)titleColor
                          BorderColor:(UIColor *)borderColor CornerRadius:(CGFloat)cornerRadius constraints:(PJConstraintMaker)constraints touchUp:(PJButtonBlock)touchUp; //!< 圆角button

@end
