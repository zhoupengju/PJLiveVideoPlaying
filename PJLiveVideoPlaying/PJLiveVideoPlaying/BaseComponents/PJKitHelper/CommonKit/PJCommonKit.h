//
//  PJCommonKit.h
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Blocks

typedef void (^PJVoidBlock)(void);

typedef void (^PJStringBlock)(NSString *result);

typedef void (^PJBoolBlock)(BOOL result);

typedef void(^SuccessArrayBlock)(NSArray *arr);

typedef void(^PJSuccessArrayLevelBlock)(id model, NSArray *auditionList, NSString *level, NSString *permission);

typedef void(^PJSuccessArrayPlayerBlock)(NSArray *arr, NSArray *arrAudition);

typedef void(^PJSuccessModelLastModelBlock)(NSArray *arr, id lastModel, NSString *level);

typedef void(^PJSuccessModelBlock)(id model);

typedef void (^ErrorBlock)(NSString *errorMsg);

#pragma mark - 数组回调block
typedef void (^PJArrayBlock)(NSArray *arr);

typedef void (^PJArrayMessageBlock)(NSArray *arr, NSString *msg);

#pragma mark - 按钮回调block
typedef void (^PJButtonBlock)(UIButton *sender);

typedef void (^PJValueChangedBlock)(id sender);

typedef void (^PJEditChangedBlock)(id sender);

typedef void (^PJButtonIndexBlock)(NSUInteger index, UIButton *sender);

#pragma mark - 手势回调block
typedef void (^PJGestureBlock)(UIGestureRecognizer *sender);

typedef void (^PJTapGestureBlock)(UITapGestureRecognizer *sender);

typedef void (^PJLongGestureBlock)(UILongPressGestureRecognizer *sender);
                                    
#pragma mark - 约束回调block
typedef void (^PJConstraintMaker)(MASConstraintMaker *make);

#pragma mark - Judge

#define kIsEmptyString(s) (s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0))

@interface PJCommonKit : NSObject

@end
