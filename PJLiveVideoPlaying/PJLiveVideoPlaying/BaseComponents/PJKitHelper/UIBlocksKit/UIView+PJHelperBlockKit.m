//
//  UIView+PJHelperBlockKit.m
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import "UIView+PJHelperBlockKit.h"

static const void *s_pj_tapGestureKey = "s_pj_tapGestureKey";
static const void *s_pj_longGestureKey = "s_pj_longGestureKey";

@implementation UIView (PJHelperBlockKit)

-(UITapGestureRecognizer *)pj_tapGesture {

    return objc_getAssociatedObject(self, s_pj_tapGestureKey);
}

-(UILongPressGestureRecognizer *)pj_longGesture {

    return objc_getAssociatedObject(self, s_pj_longGestureKey);
}

-(void)pj_addTapGestureWithCallback:(PJTapGestureBlock)onTaped {

    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.pj_onTapGesture = onTaped;
    [self addGestureRecognizer:tap];
    
    objc_setAssociatedObject(self, s_pj_tapGestureKey, onTaped, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)pj_addLongGestureWithCallback:(PJLongGestureBlock)onLongPressed {

    self.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] init];
    longGesture.pj_onLongGesture = onLongPressed;
    [self addGestureRecognizer:longGesture];
    
    objc_setAssociatedObject(self, s_pj_longGestureKey, onLongPressed, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
