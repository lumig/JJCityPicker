//
//  JJCityPicker.h
//  JJCityPicker
//
//  Created by jessie on 2018/7/14.
//  Copyright © 2018年 luming. All rights reserved.
//


/**
 针对通过plist的方式实现省市区三级联动
 */
#import <UIKit/UIKit.h>


@class JJToolBar;
@protocol JJCityPickerDelegate <NSObject>

-(void)jjCityPicker:(NSString *)city;
@end

@interface JJCityPicker : UIView



@property (nonatomic,strong) JJToolBar *toolBar;

@property(nonatomic, assign)id<JJCityPickerDelegate> delegate;

@end
