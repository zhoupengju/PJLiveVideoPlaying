//
//  UISlider+PJHelperBlocksKit.h
//  hentaneQiYe
//
//  Created by 周鹏钜 on 17/1/2.
//  Copyright © 2017年 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISlider (PJHelperBlocksKit)

+ (instancetype)pj_sliderWithThumbImage:(UIImage *)thumbImage
                         superView:(UIView *)superView
                       constraints:(PJConstraintMaker)constraints;

//+ (instancetype)pj_sliderWithImage:(id)minImage
//                       maxImage:(id)maxImage thumbImage:(id)thumbImage
//                         superView:(UIView *)superView
//                       constraints:(PJConstraintMaker)constraints
//                           touchUp:(PJButtonBlock)touchUp;

+ (instancetype)pj_sliderWithSQSuperView:(UIView *)superView
                            constraints:(PJConstraintMaker)constraints;

@end
