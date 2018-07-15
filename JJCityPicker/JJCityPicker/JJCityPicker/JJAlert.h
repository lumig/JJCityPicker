//
//  JJAlert.h
//  JJCityPicker
//
//  Created by jessie on 2018/7/15.
//  Copyright © 2018年 luming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJAlert : UIView

+ (instancetype)shareInstance;

- (void)hide;

/**
 添加底部动画view
 */
- (void)showAnimationWithBottomView:(UIView *)view withHeight:(CGFloat )height;



/**
 
 省市区三级联动弹框
 */
- (void)showAnimationForCityPicker:(UIView *)picker;


@end
