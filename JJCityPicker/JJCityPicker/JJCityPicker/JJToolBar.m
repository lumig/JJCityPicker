//
//  JJToolBar.m
//  JJCityPicker
//
//  Created by jessie on 2018/7/14.
//  Copyright © 2018年 luming. All rights reserved.
//

#import "JJToolBar.h"
#import "UIView+Extra.h"
#import "CAppConfig.h"

#import <Masonry.h>

@interface   JJToolBar()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *cancelBar;
@property (nonatomic,strong) UILabel *commitBar;
@property (nonatomic,strong) UIView *lineView;

@end

@implementation JJToolBar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubview];
    }
    return self;
}


#pragma 初始化
- (void)initSubview{
    
    [self addSubview:self.cancelBar];
    @weakify(self);
    [self.cancelBar addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        @strongify(self);
        if (self.cancelBarBlock) {
            self.cancelBarBlock();
        }
    }];
    

    [_cancelBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@10);
    }];
    
    
    [self addSubview:self.commitBar];
    [self.commitBar addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        @strongify(self);
        if (self.commitBarBlock) {
            self.commitBarBlock();
        }
    }];
    [self.commitBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.right.equalTo(@-10);
    }];
    
    
    
    [self addSubview:self.titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(self.cancelBar).offset(20);
        make.right.equalTo(self.commitBar).offset(20);;
        
    }];
    
    
    
    [self addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(@43.5);
        make.height.equalTo(@0.5);
    }];
    
    
    
    
    
}



#pragma setter and getter


- (UILabel *)cancelBar
{
    if (!_cancelBar) {
        _cancelBar = [UILabel new];
        _cancelBar.textColor =  [UIColor colorWithRed:0.09  green:0.46  blue:0.9 alpha:1];
        _cancelBar.font = [UIFont systemFontOfSize:14];
        _cancelBar.textAlignment = NSTextAlignmentLeft;
        _cancelBar.text = @"取消";
        
    }
    return _cancelBar;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.text = @"";
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)commitBar
{
    if (!_commitBar) {
        _commitBar = [UILabel new];
        _commitBar.font = [UIFont systemFontOfSize:14];
        _commitBar.textColor =  [UIColor colorWithRed:0.09  green:0.46  blue:0.9 alpha:1];

        _commitBar.text = @"完成";
        _commitBar.textAlignment = NSTextAlignmentRight;
    }
    return _commitBar;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithRed:0.8  green:0.8  blue:0.8 alpha:1];
    }
    return _lineView;
}


- (void)setCancelBarTitle:(NSString *)cancelBarTitle
{
    _cancelBarTitle = cancelBarTitle;
    if (self.cancelBar) {
        self.cancelBar.text = cancelBarTitle;
    }
}

- (void)setCancelBarColor:(UIColor *)cancelBarColor
{
    _cancelBarColor = cancelBarColor;
    if (self.cancelBar) {
        self.cancelBar.textColor = cancelBarColor;
    }
}


- (void)setCommitBarTitle:(NSString *)commitBarTitle
{
    _commitBarTitle = commitBarTitle;
    if (self.commitBar) {
        self.commitBar.text = commitBarTitle;
    }
}


- (void)setCommitBarColor:(UIColor *)commitBarColor
{
    _cancelBarColor = commitBarColor;
    if (self.commitBar) {
        self.commitBar.textColor = commitBarColor;
    }
}


- (void)setTitleLabelTitle:(NSString *)titleLabelTitle
{
    _titleLabelTitle = titleLabelTitle;
    if (self.titleLabel) {
        self.titleLabel.text = titleLabelTitle;
    }
}

- (void)setTitleLabelColor:(UIColor *)titleLabelColor
{
    _titleLabelColor = titleLabelColor;
    if (self.titleLabel) {
        self.titleLabel.textColor = titleLabelColor;
    }
}

@end
