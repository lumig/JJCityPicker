//
//  JJToolBar.h
//  JJCityPicker
//
//  Created by jessie on 2018/7/14.
//  Copyright © 2018年 luming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJToolBar : UIView



/**
 取消按钮设置
 */
@property (nonatomic,copy) NSString *cancelBarTitle;
@property (nonatomic,strong) UIColor *cancelBarColor;



/**
 完成按钮设置
 */
@property (nonatomic,copy) NSString *commitBarTitle;
@property (nonatomic,strong) UIColor *commitBarColor;



/**
 标题
 */
@property (nonatomic,copy) NSString *titleLabelTitle;
@property (nonatomic,strong) UIColor *titleLabelColor;



/**
 取消按钮点击事件
 */
@property (nonatomic,copy) void (^cancelBarBlock)();

/**
 完成按钮点击事件
 */
@property (nonatomic,copy) void (^commitBarBlock)();


@end
