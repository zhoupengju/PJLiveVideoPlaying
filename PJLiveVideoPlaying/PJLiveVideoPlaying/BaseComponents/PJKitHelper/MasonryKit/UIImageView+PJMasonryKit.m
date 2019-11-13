//
//  UIImageView+PJMasonryKit.m
//  TRTHealthDoctor
//
//  Created by 周鹏钜 on 2018/9/29.
//  Copyright © 2018年 zhoupengju. All rights reserved.
//

#import "UIImageView+PJMasonryKit.h"

@implementation UIImageView (PJMasonryKit)

+(instancetype)pj_imageView {

    return [self pj_imageViewWithSuperView:nil constraints:nil];
}

+(instancetype)pj_imageViewWithSuperView:(UIView *)superView constraints:(PJConstraintMaker)constraints {

    return [self pj_imageViewWithSuperView:superView constraints:constraints onTaped:nil];
}

+(instancetype)pj_imageViewWithSuperView:(UIView *)superView constraints:(PJConstraintMaker)constraints onTaped:(PJTapGestureBlock)onTaped {

    return [self pj_imageViewWithImage:nil isCircle:NO superView:superView constraints:constraints onTaped:onTaped];
}

+(instancetype)pj_imageViewWithImage:(id)image superView:(UIView *)superView constraints:(PJConstraintMaker)constraints {

    return [self pj_imageViewWithImage:image superView:superView constraints:constraints onTaped:nil];
}

+(instancetype)pj_imageViewWithImage:(id)image superView:(UIView *)superView constraints:(PJConstraintMaker)constraints onTaped:(PJTapGestureBlock)onTaped {

    return [self pj_imageViewWithImage:image isCircle:NO superView:superView constraints:constraints onTaped:onTaped];
}

+(instancetype)pj_imageViewWithImage:(id)image isCircle:(BOOL)isCircle superView:(UIView *)superView constraints:(PJConstraintMaker)constraints onTaped:(PJTapGestureBlock)onTaped {

    UIImageView *imageView = [[UIImageView alloc] init];
    [superView addSubview:imageView];
    if (image != nil) {
    
        if ([image isKindOfClass:[NSString class]]) {
        
            imageView.image = [UIImage imageNamed:image];
        } else {
        
            imageView.image = image;
        }
    }
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    if (onTaped) {
    
        [imageView pj_addTapGestureWithCallback:onTaped];
    }
    
    if (constraints && superView) {
    
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            constraints(make);
        }];
    }
    
    if (isCircle) {
    
        [imageView performSelector:@selector(updateLayerToCircle:) withObject:imageView afterDelay:0.0];
    }
    
    return imageView;
}

- (void)updateLayerToCircle:(UIImageView *)imgView {

    imgView.layer.cornerRadius = imgView.Lwidth/2.0;
    imgView.layer.masksToBounds = YES;
    imgView.clipsToBounds = YES;
}

@end
