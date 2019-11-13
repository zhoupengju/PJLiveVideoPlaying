//
//  UIButton+PJHelperBlocksKit.m
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import "UIButton+PJHelperBlocksKit.h"

@implementation UIButton (PJHelperBlocksKit)

+(instancetype)pj_buttonWithTouchUp:(PJButtonBlock)onTouchUp {
    
    return [self pj_buttonWithSuperView:nil constraints:nil touchUp:onTouchUp];
}

+ (instancetype)pj_buttonWithSuperView:(UIView *)superView
                           constraints:(PJConstraintMaker)constraints
                               touchUp:(PJButtonBlock)touchUp {
    return [self PJ_buttonWithTitle:nil
                          superView:superView
                        constraints:constraints
                            touchUp:touchUp];
}

+(instancetype)PJ_buttonWithTitle:(NSString *)title superView:(UIView *)superView constraints:(PJConstraintMaker)constraints touchUp:(PJButtonBlock)touchUp {
    
    return [self private_pj_buttonWithTitle:title withFont:nil color:nil
                                      image:nil selImage:nil superView:superView constraints:constraints touchUp:touchUp];
}

+(instancetype)pj_buttonWithImage:(id)image superView:(UIView *)superView constraints:(PJConstraintMaker)constraints touchUp:(PJButtonBlock)touchUp {
    
    return [self pj_buttonWithImage:image selectedImage:nil superView:superView constraints:constraints touchUp:touchUp];
}

+ (instancetype)pj_buttonWithImage:(id)image
                     selectedImage:(id)selectedImage
                         superView:(UIView *)superView
                       constraints:(PJConstraintMaker)constraints
                           touchUp:(PJButtonBlock)touchUp {
    return [self private_pj_buttonWithTitle:nil
                                   withFont:nil color:nil
                                      image:image
                                   selImage:selectedImage
                                  superView:superView
                                constraints:constraints
                                    touchUp:touchUp];
}

+(instancetype)pj_buttonWithSuperView:(UIView *)superView withFont:(UIFont *)font color:(UIColor *)color constraints:(PJConstraintMaker)constraints touchUp:(PJButtonBlock)touchUp {
    
    return [self private_pj_buttonWithTitle:nil withFont:font color:color image:nil selImage:nil superView:superView constraints:constraints touchUp:touchUp];
}

#pragma mark - Private
+ (instancetype)private_pj_buttonWithTitle:(NSString *)title
                                  withFont:(UIFont *)font
                                     color:(UIColor *)color
                                     image:(id)image
                                  selImage:(id)selImage
                                 superView:(UIView *)superView
                               constraints:(PJConstraintMaker)constaints
                                   touchUp:(PJButtonBlock)touchUp {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.pj_onTouchUp = touchUp;
    
    if (!kIsEmptyString(title)) {
        
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    button.titleLabel.font = font;
    //    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:color forState:UIControlStateNormal];
    
    UIImage *normalImage = nil;
    if ([image isKindOfClass:[NSString class]]) {
        
        normalImage = [UIImage imageNamed:image];
    } else if ([image isKindOfClass:[UIImage class]]) {
        
        normalImage = image;
    }
    
    UIImage *selectedImage = nil;
    if ([selImage isKindOfClass:[NSString class]]) {
        
        selectedImage = [UIImage imageNamed:selImage];
    } else if ([selImage isKindOfClass:[UIImage class]]) {
        
        selectedImage = image;
    }
    
    if (normalImage) {
        
        [button setImage:normalImage forState:UIControlStateNormal];
    }
    
    if (selectedImage) {
        
        [button setImage:selectedImage forState:UIControlStateSelected];
    }
    
    [superView addSubview:button];
    
    if (superView && constaints) {
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            constaints(make);
        }];
    }
    
    return button;
}

+(instancetype)pj_buttonWithTitle:(NSString *)title withFont:(UIFont *)font color:(UIColor *)color bgImage:(id)bgImage superView:(UIView *)superView constraints:(PJConstraintMaker)constaints touchUp:(PJButtonBlock)touchUp {
    
    return [self private_pj_buttonWithTitle:title withFont:font color:color bgImage:bgImage superView:superView constraints:constaints touchUp:touchUp];
}

#pragma mark - Private
+ (instancetype)private_pj_buttonWithTitle:(NSString *)title
                                  withFont:(UIFont *)font
                                     color:(UIColor *)color
                                   bgImage:(id)bgImage
                                 superView:(UIView *)superView
                               constraints:(PJConstraintMaker)constaints
                                   touchUp:(PJButtonBlock)touchUp {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.pj_onTouchUp = touchUp;
    
    if (!kIsEmptyString(title)) {
        
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    button.titleLabel.font = font;
    //    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:color forState:UIControlStateNormal];
    
    UIImage *backgroundImage = nil;
    if ([bgImage isKindOfClass:[NSString class]]) {
        
        backgroundImage = [UIImage imageNamed:bgImage];
    } else if ([bgImage isKindOfClass:[UIImage class]]) {
        
        backgroundImage = bgImage;
    }
    
    if (backgroundImage) {
        
        [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    }
    
    [superView addSubview:button];
    
    if (superView && constaints) {
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            constaints(make);
        }];
    }
    
    return button;
}

// 订单
+(instancetype)pj_buttonWithSuperView:(UIView *)superView
                                Title:(NSString *)title withFont:(UIFont *)font TitleColor:(UIColor *)titleColor
                          BorderColor:(UIColor *)borderColor constraints:(PJConstraintMaker)constraints touchUp:(PJButtonBlock)touchUp {
    
    return [self private_pj_buttonWithSuperView:superView Title:title withFont:font TitleColor:titleColor BorderColor:borderColor constraints:constraints touchUp:touchUp];
}

#pragma mark - Private
+ (instancetype)private_pj_buttonWithSuperView:(UIView *)superView Title:(NSString *)title
                                      withFont:(UIFont *)font
                                    TitleColor:(UIColor *)titleColor
                                   BorderColor:(UIColor *)borderColor
                                   constraints:(PJConstraintMaker)constraints
                                       touchUp:(PJButtonBlock)touchUp {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.pj_onTouchUp = touchUp;
    
    if (!kIsEmptyString(title)) {
        
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    button.titleLabel.font = font;
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 3;
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = 1;
    
    [superView addSubview:button];
    
    if (superView && constraints) {
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            constraints(make);
        }];
    }
    
    return button;
}

// 圆角button
+(instancetype)pj_buttonWithSuperView:(UIView *)superView
                                Title:(NSString *)title withFont:(UIFont *)font TitleColor:(UIColor *)titleColor
                          BorderColor:(UIColor *)borderColor CornerRadius:(CGFloat)cornerRadius constraints:(PJConstraintMaker)constraints touchUp:(PJButtonBlock)touchUp {
    
    return [self private_pj_buttonWithSuperView:superView Title:title withFont:font TitleColor:titleColor BorderColor:borderColor CornerRadius:cornerRadius constraints:constraints touchUp:touchUp];
}

#pragma mark - Private
+ (instancetype)private_pj_buttonWithSuperView:(UIView *)superView Title:(NSString *)title
                                      withFont:(UIFont *)font
                                    TitleColor:(UIColor *)titleColor
                                   BorderColor:(UIColor *)borderColor
                                  CornerRadius:(CGFloat)cornerRadius
                                   constraints:(PJConstraintMaker)constraints
                                       touchUp:(PJButtonBlock)touchUp {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.pj_onTouchUp = touchUp;
    
    if (!kIsEmptyString(title)) {
        
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    button.titleLabel.font = font;
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = cornerRadius;
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = 1;
    
    [superView addSubview:button];
    
    if (superView && constraints) {
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            constraints(make);
        }];
    }
    
    return button;
}

@end
