//
//  UIView+PJMasonryKit.m
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import "UIView+PJMasonryKit.h"

@implementation UIView (PJMasonryKit)

+(instancetype)pj_viewWithSuperView:(UIView *)superView {

    return [self pj_viewWithSuperView:superView onTaped:nil];
}

+(instancetype)pj_viewWithSuperView:(UIView *)superView
                            onTaped:(PJTapGestureBlock)onTaped {

    return [self pj_viewWithSuperView:superView constrains:nil color:nil onTaped:onTaped];
}

+(instancetype)pj_viewWithSuperView:(UIView *)superView
                         constrains:(PJConstraintMaker)constraints {
    
    return [self pj_viewWithSuperView:superView constrains:constraints color:nil onTaped:nil];
}

+(instancetype)pj_viewWithSuperView:(UIView *)superView color:(UIColor *)color constrains:(PJConstraintMaker)constraints {

    return [self pj_viewWithSuperView:superView constrains:constraints color:color onTaped:nil];
}

+(instancetype)pj_viewWithSuperView:(UIView *)superView
                         constrains:(PJConstraintMaker)constraints
                            color:(UIColor *)color onTaped:(PJTapGestureBlock)onTaped {
    
    UIView *view = [[UIView alloc] init];
    [superView addSubview:view];
    if (onTaped) {
    
        [view pj_addTapGestureWithCallback:onTaped];
    }

    if (color != nil) {
    
        view.backgroundColor = color;
    } else {
    
        view.backgroundColor = [UIColor whiteColor];
    }
    
    if(superView) {
    
        if (constraints) {
        
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                constraints(make);
            }];
        } else {
        
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.edges.mas_equalTo(superView);
            }];
        }
    }
    
    return view;
}

+ (instancetype)pj_addTopLineToView:(UIView *)toView
                              height:(CGFloat)height
                               color:(UIColor *)color {
    
    return [self pj_addTopLineToView:toView
                         leftPadding:0
                        rightPadding:0
                              height:height
                               color:color];
}

+ (instancetype)pj_addTopLineToView:(UIView *)toView
                            distance:(CGFloat)distance
                              height:(CGFloat)height
                               color:(UIColor *)color {

    return [self pj_private_addLineToView:toView isTop:YES distance:distance
                       leftPadding:0 rightPadding:0 height:height color:color];
}

+ (instancetype)pj_addTopLineToView:(UIView *)toView
                         leftPadding:(CGFloat)leftPadding
                        rightPadding:(CGFloat)rightPadding
                              height:(CGFloat)height
                              color:(UIColor *)color {

    return [self pj_private_addLineToView:toView isTop:YES distance:0 leftPadding:leftPadding rightPadding:rightPadding height:height color:color];
}

+ (instancetype)pj_addBottomLineToView:(UIView *)toView
                                 height:(CGFloat)height
                                  color:(UIColor *)color {

    return [self pj_addBottomLineToView:toView leftPadding:0 rightPadding:0 height:height color:color];
}

+ (instancetype)pj_addBottomLineToView:(UIView *)toView
                              distance:(CGFloat)distance
                                height:(CGFloat)height
                                 color:(UIColor *)color {
    
    return [self pj_private_addLineToView:toView isTop:NO distance:distance leftPadding:0 rightPadding:0 height:height color:color];
}

+ (instancetype)pj_addBottomLineToView:(UIView *)toView
                            leftPadding:(CGFloat)leftPadding
                           rightPadding:(CGFloat)rightPadding
                                 height:(CGFloat)height
                                  color:(UIColor *)color {

    return [self pj_private_addLineToView:toView isTop:NO distance:0 leftPadding:leftPadding rightPadding:rightPadding height:height color:color];
}

#pragma mark - Private
+ (instancetype)pj_private_addLineToView:(UIView *)toView
                                    isTop:(BOOL)isTop
                                 distance:(CGFloat)distance
                              leftPadding:(CGFloat)leftPadding
                             rightPadding:(CGFloat)rightPadding
                                   height:(CGFloat)height
                                    color:(UIColor *)color {

    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = color;
    [toView addSubview:lineView];
    
    if (toView) {
    
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(leftPadding);
            
            if (isTop) {
            
                make.top.mas_equalTo(distance);
            } else {
            
                make.bottom.mas_equalTo(distance);
            }
            
            make.right.mas_equalTo(rightPadding);
            make.height.mas_equalTo(height);
        }];
    }
    
    return lineView;
}

@end
