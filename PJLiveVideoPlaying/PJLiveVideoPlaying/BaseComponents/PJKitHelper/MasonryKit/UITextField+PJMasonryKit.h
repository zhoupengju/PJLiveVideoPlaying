//
//  UITextField+PJMasonryKit.h
//  sqjr
//
//  Created by 周鹏钜 on 2017/8/7.
//  Copyright © 2017年 Hzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (PJMasonryKit)

+(instancetype)pj_createFieldNoLineWithPlaceholder:(NSString *)placeholder superView:(UIView *)superView constraints:(PJConstraintMaker)constraints;

+ (instancetype)pj_createFieldWithPlaceholder:(NSString *)placeholder superView:(UIView *)superView constraints:(PJConstraintMaker)constraints;

@end
