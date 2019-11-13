//
//  UIGestureRecognizer+PJHelperBlockKit.h
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (PJHelperBlockKit)

@property (nonatomic, copy) PJGestureBlock pj_onGesture;

@property (nonatomic, copy) PJTapGestureBlock pj_onTapGesture;

@property (nonatomic, copy) PJLongGestureBlock pj_onLongGesture;

@end
