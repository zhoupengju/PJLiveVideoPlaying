//
//  UILabel+PJMasonryKit.m
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import "UILabel+PJMasonryKit.h"

@implementation UILabel (PJMasonryKit)

+(instancetype)pj_labelWithFont:(CGFloat)font {

    return [self pj_labelWithText:nil font:font];
}

+ (instancetype)pj_labelWithFont:(CGFloat)font
                       superView:(UIView *)superView
                     constraints:(PJConstraintMaker)constraints {

    return [self pj_labelWithText:nil font:font superView:superView constraints:constraints];
}

+ (instancetype)pj_labelWithFont:(CGFloat)font color:(UIColor *)color
                       superView:(UIView *)superView
                     constraints:(PJConstraintMaker)constraints {
    return [self pj_labelWithText:nil font:font IsBold:NO color:color Direction:NSTextAlignmentLeft lines:0 superView:superView constraints:constraints];
}

+(instancetype)pj_labelWithText:(NSString *)text font:(CGFloat)font {

    return [self pj_labelWithText:text font:font superView:nil constraints:nil];
}

+(instancetype)pj_labelWithFont:(CGFloat)font Direction:(NSTextAlignment)direction superView:(UIView *)superView constraints:(PJConstraintMaker)constraints{

    return [self pj_labelWithText:nil font:font IsBold:NO color:nil Direction:direction lines:1 superView:superView constraints:constraints];
}

+(instancetype)pj_labelWithText:(NSString *)text font:(CGFloat)font superView:(UIView *)superView constraints:(PJConstraintMaker)constraints {

    return [self pj_labelWithText:text font:font lines:1 superView:superView constraints:constraints];
}

+(instancetype)pj_labelWithText:(NSString *)text font:(CGFloat)font lines:(NSInteger)lines superView:(UIView *)superView constraints:(PJConstraintMaker)constraints {

    return [self pj_labelWithText:text font:font IsBold:NO color:nil Direction:NSTextAlignmentLeft lines:lines superView:superView constraints:constraints];
}

+(instancetype)pj_labelWithText:(NSString *)text font:(CGFloat)font IsBold:(BOOL)isBold color:(UIColor *)color Direction:(NSTextAlignment)direction lines:(NSInteger)lines superView:(UIView *)superView constraints:(PJConstraintMaker)constraints {

    UILabel *label = [[UILabel alloc] init];
    [superView addSubview:label];
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = direction;
    label.numberOfLines = lines;
    
    if (isBold) {
    
        label.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:font];
    } else {
        label.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:font];
    }
    
    if (color != nil) {
    
        label.textColor = color;
    } else {
    
        label.textColor = [UIColor blackColor];
    }

    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
    if (superView && constraints) {
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            constraints(make);
        }];
    }
    
    return label;
}

+(instancetype)pj_labelWithText:(NSString *)text font:(CGFloat)font color:(UIColor *)color Direction:(NSTextAlignment)direction superView:(UIView *)superView constraints:(PJConstraintMaker)constraints onTaped:(PJTapGestureBlock)onTaped {

    UILabel *label = [[UILabel alloc] init];
    [superView addSubview:label];
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = direction;
    label.numberOfLines = 1;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    label.font = [UIFont systemFontOfSize:font];
    if (onTaped) {
        
        [label pj_addTapGestureWithCallback:onTaped];
    }
    
    if (color != nil) {
        
        label.textColor = color;
    } else {
        
        label.textColor = [UIColor blackColor];
    }
    
    if (superView && constraints) {
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            constraints(make);
        }];
    }
    
    return label;
}

@end
