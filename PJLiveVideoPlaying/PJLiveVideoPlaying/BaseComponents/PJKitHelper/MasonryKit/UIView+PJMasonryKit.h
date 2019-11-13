//
//  UIView+PJMasonryKit.h
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PJMasonryKit)

+ (instancetype)pj_viewWithSuperView:(UIView *)superView;

+(instancetype)pj_viewWithSuperView:(UIView *)superView
                            onTaped:(PJTapGestureBlock)onTaped;

+(instancetype)pj_viewWithSuperView:(UIView *)superView
                         constrains:(PJConstraintMaker)constraints;

+(instancetype)pj_viewWithSuperView:(UIView *)superView color:(UIColor *)color
                         constrains:(PJConstraintMaker)constraints;

+(instancetype)pj_viewWithSuperView:(UIView *)superView
                         constrains:(PJConstraintMaker)constraints color:(UIColor *)color onTaped:(PJTapGestureBlock)onTaped;



@end
