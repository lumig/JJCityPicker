//
//  JJAlert.m
//  JJCityPicker
//
//  Created by jessie on 2018/7/15.
//  Copyright © 2018年 luming. All rights reserved.
//

#import "JJAlert.h"
#import <Masonry.h>
#import "CAppConfig.h"
@interface JJAlert()

@property (nonatomic, strong) UIWindow *window;
//点击可以隐藏的背景
@property (nonatomic, strong) UIView *bg;
//当BG缩小时,顶部拼凑一个可以点击的view
@property (nonatomic, strong) UIView *animateView;

@end

@implementation JJAlert

+ (instancetype)shareInstance
{
    static JJAlert *alert;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alert = [[self.class alloc]init];
    });
    return alert;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        if (!_bg)
        {
            self.bg = [[UIView alloc] initWithFrame:CGRectZero];
            self.bg.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.6f];
            self.bg.hidden = YES;
            [self.window addSubview:self.bg];
            
            //轻触手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
            tap.numberOfTapsRequired = 1;
            [self.bg addGestureRecognizer:tap];
            
            //拖拽手势
            UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
            [self.bg addGestureRecognizer:panGesture];
            
            
            [self.bg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.window);
            }];
        }
    }
    return self;
}


- (void)hide
{
    
    self.bg.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.6f];
    [self.window resignKeyWindow];
    self.window.hidden = YES;
    self.bg.hidden = YES;
    [self.bg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    [self.animateView removeFromSuperview];
    self.animateView = nil;
    
}

- (void)showAnimationWithBottomView:(UIView *)view withHeight:(CGFloat )height{
    [self hide];
    [self.window addSubview:view];
    self.animateView = view;
    view.frame = CGRectMake(0, ScreenHeight, ScreenWidth, height);
    [self show];
    [UIView animateWithDuration:0.5 animations:^{
        view.frame = CGRectMake(0, ScreenHeight - height, ScreenWidth, height);
    }];
    
}


- (void)showAnimationForCityPicker:(UIView *)picker{
    [self hide];
    [self.window addSubview:picker];
    self.animateView = picker;
    picker.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 224);
    [self show];
    [UIView animateWithDuration:0.5 animations:^{
        picker.frame = CGRectMake(0, ScreenHeight - 224, ScreenWidth, 224);
    }];
}

- (void)show
{
    
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [self.window makeKeyAndVisible];
    self.window.hidden = NO;
    self.bg.hidden = NO;
    
}


#pragma mark -- setter  and getter
- (UIWindow *)window
{
    if (!_window)
    {
        UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        window.backgroundColor = [UIColor clearColor];
        window.windowLevel = UIWindowLevelNormal;
        _window = window;
    }
    return _window;
}

@end
