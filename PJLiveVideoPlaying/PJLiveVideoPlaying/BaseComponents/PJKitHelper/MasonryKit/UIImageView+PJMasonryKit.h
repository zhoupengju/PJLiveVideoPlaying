//
//  UIImageView+PJMasonryKit.h
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (PJMasonryKit)

+ (instancetype)pj_imageView;

+ (instancetype)pj_imageViewWithSuperView:(UIView *)superView
                               constraints:(PJConstraintMaker)constraints;

+ (instancetype)pj_imageViewWithSuperView:(UIView *)superView
                               constraints:(PJConstraintMaker)constraints
                                   onTaped:(PJTapGestureBlock)onTaped;

+ (instancetype)pj_imageViewWithImage:(id)image
                             superView:(UIView *)superView
                           constraints:(PJConstraintMaker)constraints;

+ (instancetype)pj_imageViewWithImage:(id)image
                             superView:(UIView *)superView
                           constraints:(PJConstraintMaker)constraints
                               onTaped:(PJTapGestureBlock)onTaped;

+ (instancetype)pj_imageViewWithImage:(id)image
                              isCircle:(BOOL)isCircle
                             superView:(UIView *)superView
                           constraints:(PJConstraintMaker)constraints
                               onTaped:(PJTapGestureBlock)onTaped;

@end
