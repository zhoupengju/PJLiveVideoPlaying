//
//  UISlider+PJHelperBlocksKit.m
//  hentaneQiYe
//
//  Created by 周鹏钜 on 17/1/2.
//  Copyright © 2017年 zhoupengju. All rights reserved.
//

#import "UISlider+PJHelperBlocksKit.h"

@implementation UISlider (PJHelperBlocksKit)

+(instancetype)pj_sliderWithThumbImage:(UIImage *)thumbImage superView:(UIView *)superView constraints:(PJConstraintMaker)constraints {

    return [self private_pj_sliderWithThumbImage:thumbImage superView:superView constraints:constraints];
}

//+(instancetype)pj_sliderWithImage:(id)minImage maxImage:(id)maxImage thumbImage:(id)thumbImage superView:(UIView *)superView constraints:(PJConstraintMaker)constraints touchUp:(PJButtonBlock)touchUp{
//
//    return [self private_pj_sliderWithTitle:nil image:minImage selImage:maxImage thumbImage:thumbImage superView:superView constraints:constraints touchUp:touchUp];
//}

#pragma mark - private
+ (instancetype)private_pj_sliderWithThumbImage:(UIImage *)thumbImage
                                 superView:(UIView *)superView
                               constraints:(PJConstraintMaker)constaints {
    
    UISlider *slider = [[UISlider alloc] init];

    slider.value = 0.0;
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    [slider setMaximumTrackTintColor:[UIColor whiteColor]];
    
    if (thumbImage) {
        [slider setThumbImage:thumbImage forState:UIControlStateNormal];
    }
    
    [superView addSubview:slider];
    
    if (superView && constaints) {
        
        [slider mas_makeConstraints:^(MASConstraintMaker *make) {
            
            constaints(make);
        }];
    }
    
    return slider;
}

+(instancetype)pj_sliderWithSQSuperView:(UIView *)superView constraints:(PJConstraintMaker)constraints {
    return [self private_pj_sliderWithSQSuperView:superView constraints:constraints];
}

+(instancetype)private_pj_sliderWithSQSuperView:(UIView *)superView constraints:(PJConstraintMaker)constraints {
    UISlider *slider = [[UISlider alloc] init];
    [superView addSubview:slider];
    
    slider.minimumTrackTintColor = kSlidingGlobal;
    slider.maximumTrackTintColor = kSlidingGlobal;
    slider.minimumValue = 0;//设置最小值
    slider.maximumValue = 100;//设置最大值
    slider.continuous = NO;//默认YES  如果设置为NO，则每次滑块停止移动后才触发事件
    
    if (superView && constraints) {
        [slider mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    
    return slider;
}

@end
