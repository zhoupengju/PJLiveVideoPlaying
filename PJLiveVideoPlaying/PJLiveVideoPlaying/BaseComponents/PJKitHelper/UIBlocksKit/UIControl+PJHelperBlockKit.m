//
//  UIControl+PJHelperBlockKit.m
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import "UIControl+PJHelperBlockKit.h"

static const void *s_PJButtonTouchUpKey = "s_PJButtonTouchUpKey";
static const void *s_PJButtonTouchDownKey = "s_PJButtonTouchDownKey";
static const void *s_PJOnValueChangedKey = "s_PJOnValueChangedKey";
static const void *s_PJOnEditChangedKey = "s_PJOnEditChangedKey";

@implementation UIControl (PJHelperBlockKit)

-(PJButtonBlock)pj_onTouchUp {

    return objc_getAssociatedObject(self, s_PJButtonTouchUpKey);
}

-(void)setPj_onTouchUp:(PJButtonBlock)pj_onTouchUp {

    objc_setAssociatedObject(self, s_PJButtonTouchUpKey, pj_onTouchUp, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(pj_private_onTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addTarget:self action:@selector(pj_private_onTouchUp:) forControlEvents:UIControlEventTouchUpInside];
}

-(PJButtonBlock)pj_onTouchDown {

    return objc_getAssociatedObject(self, s_PJButtonTouchDownKey);
}

-(void)setPj_onTouchDown:(PJButtonBlock)pj_onTouchDown {

    objc_setAssociatedObject(self, s_PJButtonTouchDownKey, pj_onTouchDown, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(pj_private_onTouchDown:) forControlEvents:UIControlEventTouchDown];
    
    [self addTarget:self action:@selector(pj_private_onTouchDown:) forControlEvents:UIControlEventTouchDown];
}

-(PJValueChangedBlock)pj_onValueChanged {

    return objc_getAssociatedObject(self, s_PJOnValueChangedKey);
}

-(void)setPj_onValueChanged:(PJValueChangedBlock)pj_onValueChanged {

    objc_setAssociatedObject(self, s_PJOnValueChangedKey, pj_onValueChanged, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(pj_private_onValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self addTarget:self action:@selector(pj_private_onValueChanged:) forControlEvents:UIControlEventValueChanged];
}

-(PJEditChangedBlock)pj_onEditChanged {

    return objc_getAssociatedObject(self, s_PJOnEditChangedKey);
}

-(void)setPj_onEditChanged:(PJEditChangedBlock)pj_onEditChanged {

    objc_setAssociatedObject(self, s_PJOnEditChangedKey, pj_onEditChanged, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(pj_private_onEditChanged:) forControlEvents:UIControlEventEditingChanged];
    
    [self addTarget:self action:@selector(pj_private_onEditChanged:) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - Private
- (void)pj_private_onTouchUp:(id)sender {

    PJButtonBlock block = [self pj_onTouchUp];
    
    if (block) {
    
        block(sender);
    }
}

- (void)pj_private_onTouchDown:(id)sender {

    PJButtonBlock block = [self pj_onTouchDown];
    
    if (block) {
    
        block(sender);
    }
}

- (void)pj_private_onValueChanged:(id)sender {

    PJValueChangedBlock block = [self pj_onValueChanged];
    
    if (block) {
    
        block(sender);
    }
}

- (void)pj_private_onEditChanged:(id)sender {

    PJEditChangedBlock block = [self pj_onEditChanged];
    
    if (block) {
    
        block(sender);
    }
}

@end
