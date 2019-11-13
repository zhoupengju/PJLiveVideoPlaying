//
//  UIGestureRecognizer+PJHelperBlockKit.m
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import "UIGestureRecognizer+PJHelperBlockKit.h"

static const void *s_pj_gestureKey = "s_pj_gestureKey";
static const void *s_pj_tap_gestureKey = "s_pj_tap_gestureKey";
static const void *s_pj_long_gestureKey = "s_pj_long_gestureKey";

@implementation UIGestureRecognizer (PJHelperBlockKit)

-(PJGestureBlock)pj_onGesture {

    return objc_getAssociatedObject(self, s_pj_gestureKey);
}

-(void)setPj_onGesture:(PJGestureBlock)pj_onGesture {

    objc_setAssociatedObject(self, s_pj_gestureKey, pj_onGesture, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(pj_private_onGesture:)];
    
    if (pj_onGesture) {
    
        [self addTarget:self action:@selector(pj_private_onGesture:)];
    }
}

-(PJTapGestureBlock)pj_onTapGesture {

    return objc_getAssociatedObject(self, s_pj_tap_gestureKey);
}

-(void)setPj_onTapGesture:(PJTapGestureBlock)pj_onTapGesture {

    objc_setAssociatedObject(self, s_pj_tap_gestureKey, pj_onTapGesture, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(pj_private_onTaped:)];
    
    if (pj_onTapGesture) {
    
        [self addTarget:self action:@selector(pj_private_onTaped:)];
    }
}

-(PJLongGestureBlock)pj_onLongGesture {

    return objc_getAssociatedObject(self, s_pj_long_gestureKey);
}

-(void)setPj_onLongGesture:(PJLongGestureBlock)pj_onLongGesture {

    objc_setAssociatedObject(self, s_pj_long_gestureKey, pj_onLongGesture, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(pj_private_onLongPressed:)];
    
    if (pj_onLongGesture) {
    
        [self addTarget:self action:@selector(pj_private_onLongPressed:)];
    }
}

#pragma mark - Private
- (void)pj_private_onGesture:(UIGestureRecognizer *)sender {

    PJGestureBlock block = [self pj_onGesture];
    if (block) {
    
        block(sender);
    }
}

- (void)pj_private_onTaped:(UITapGestureRecognizer *)sender {

    PJTapGestureBlock block = [self pj_onTapGesture];
    if (block) {
    
        block(sender);
    }
}

- (void)pj_private_onLongPressed:(UILongPressGestureRecognizer *)sender {

    PJLongGestureBlock block = [self pj_onLongGesture];
    if (block) {
    
        block(sender);
    }
}

@end
