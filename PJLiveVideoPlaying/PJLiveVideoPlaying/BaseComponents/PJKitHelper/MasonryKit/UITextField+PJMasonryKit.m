//
//  UITextField+PJMasonryKit.m
//  sqjr
//
//  Created by 周鹏钜 on 2017/8/7.
//  Copyright © 2017年 Hzz. All rights reserved.
//

#import "UITextField+PJMasonryKit.h"

@implementation UITextField (PJMasonryKit)

+(instancetype)pj_createFieldNoLineWithPlaceholder:(NSString *)placeholder superView:(UIView *)superView constraints:(PJConstraintMaker)constraints {
    
    UITextField *textField = [[UITextField alloc] init];
    [superView addSubview:textField];
    
    textField.font = KFontM(15);
    textField.textColor = kRGBColor(0x231916);
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.placeholder = placeholder;
    textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 2)];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.backgroundColor = kWhile;
    
    textField.keyboardType = UIKeyboardTypeDefault;
    
    if (superView && constraints) {
        
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    
    return textField;
}

+(instancetype)pj_createFieldWithPlaceholder:(NSString *)placeholder superView:(UIView *)superView constraints:(PJConstraintMaker)constraints {

    UITextField *textField = [[UITextField alloc] init];
    [superView addSubview:textField];
    
    textField.font = KFontM(15);
    textField.textColor = kRGBColor(0x231916);
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.placeholder = placeholder;
    textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 2)];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.backgroundColor = kWhile;
    
    textField.keyboardType = UIKeyboardTypeDefault;
    
    if (superView && constraints) {
        
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    
    [UIView pj_viewWithSuperView:textField color:kRGBColor(0xEBECED) constrains:^(MASConstraintMaker *make) {
        make.bottom.right.mas_equalTo(textField);
        make.left.mas_equalTo(textField.mas_left).offset(17);
        make.height.mas_equalTo(1);
    }];
    
    return textField;
}

@end
