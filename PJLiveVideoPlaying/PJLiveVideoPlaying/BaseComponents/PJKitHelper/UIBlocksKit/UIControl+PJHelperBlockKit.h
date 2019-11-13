//
//  UIControl+PJHelperBlockKit.h
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (PJHelperBlockKit)

@property (nonatomic, copy) PJButtonBlock pj_onTouchUp;

@property (nonatomic, copy) PJButtonBlock pj_onTouchDown;

@property (nonatomic, copy) PJValueChangedBlock pj_onValueChanged;

@property (nonatomic, copy) PJEditChangedBlock pj_onEditChanged;

@end
