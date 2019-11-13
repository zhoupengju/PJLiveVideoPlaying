//
//  UIView+PJHelperBlockKit.h
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PJHelperBlockKit)

@property (nonatomic, strong, readonly) UITapGestureRecognizer *pj_tapGesture;

@property (nonatomic, strong, readonly) UILongPressGestureRecognizer *pj_longGesture;

- (void)pj_addTapGestureWithCallback:(PJTapGestureBlock)onTaped;

- (void)pj_addLongGestureWithCallback:(PJLongGestureBlock)onLongPressed;

@end
