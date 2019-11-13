//
//  UIView+MBLayout.h
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/6.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MBLayout)

@property (nonatomic, assign) CGPoint Lorigin;
@property (nonatomic, assign) CGSize Lsize;

// shortcuts for positions
@property (nonatomic) CGFloat LcenterX;
@property (nonatomic) CGFloat LcenterY;


@property (nonatomic) CGFloat Ltop;
@property (nonatomic) CGFloat Lbottom;
@property (nonatomic) CGFloat Lright;
@property (nonatomic) CGFloat Lleft;

@property (nonatomic) CGFloat Lwidth;
@property (nonatomic) CGFloat Lheight;

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

///圆角
- (void)setCornerWithRadius:(CGFloat)radius;
///圆角加边框
- (void)setCornerWithRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)color;


@end

NS_ASSUME_NONNULL_END
