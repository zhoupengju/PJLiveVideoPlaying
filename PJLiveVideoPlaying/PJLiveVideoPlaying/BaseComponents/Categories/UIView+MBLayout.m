//
//  UIView+MBLayout.m
//  PJLiveVideoPlaying
//
//  Created by 周鹏钜 on 2019/11/6.
//  Copyright © 2019 zhoupengju. All rights reserved.
//

#import "UIView+MBLayout.h"

@implementation UIView (MBLayout)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}


-(CGFloat)Ltop
{
    return self.frame.origin.y;
}

- (void)setLtop:(CGFloat)Ltop
{
    CGRect frame = self.frame;
    frame.origin.y = Ltop;
    self.frame = frame;
}

- (CGFloat)Lright
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setLright:(CGFloat)Lright
{
    CGRect frame = self.frame;
    frame.origin.x = Lright - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)Lbottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLbottom:(CGFloat)Lbottom
{
    CGRect frame = self.frame;
    frame.origin.y = Lbottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)Lleft
{
    return self.frame.origin.x;
}

- (void)setLleft:(CGFloat)Lleft
{
    CGRect frame = self.frame;
    frame.origin.x = Lleft;
    self.frame = frame;
}

- (CGFloat)Lwidth
{
    return self.frame.size.width;
}

- (void)setLwidth:(CGFloat)Lwidth
{
    CGRect frame = self.frame;
    frame.size.width = Lwidth;
    self.frame = frame;
}

- (CGFloat)Lheight
{
    return self.frame.size.height;
}

- (void)setLheight:(CGFloat)Lheight
{
    CGRect frame = self.frame;
    frame.size.height = Lheight;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)Lorigin
{
    return self.frame.origin;
}

- (void)setLorigin:(CGPoint)Lorigin
{
    CGRect frame = self.frame;
    frame.origin = Lorigin;
    self.frame = frame;
}

- (CGSize)Lsize
{
    return self.frame.size;
}

- (void)setLsize:(CGSize)Lsize
{
    CGRect frame = self.frame;
    frame.size = Lsize;
    self.frame = frame;
}
#pragma mark - Shortcuts for positions

- (CGFloat)LcenterX
{
    return self.center.x;
}

- (void)setLcenterX:(CGFloat)LcenterX
{
    self.center = CGPointMake(LcenterX, self.center.y);
}

- (CGFloat)LcenterY
{
    return self.center.y;
}

- (void)setLcenterY:(CGFloat)LcenterY
{
    self.center = CGPointMake(self.center.x, LcenterY);
}

- (void)setCornerWithRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

- (void)setCornerWithRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)color {
    self.layer.cornerRadius = radius;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
    self.layer.masksToBounds = YES;
}

@end
