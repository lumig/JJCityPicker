//
//  JJCityPicker.m
//  JJCityPicker
//
//  Created by jessie on 2018/7/14.
//  Copyright © 2018年 luming. All rights reserved.
//

#import "JJCityPicker.h"
#import "JJToolBar.h"
#import "CAppConfig.h"
#import "UIView+Extra.h"
#import "JJAlert.h"
@interface JJCityPicker()<UIPickerViewDataSource,UIPickerViewDelegate>


/**
 数据源
 */
@property (strong, nonatomic) NSDictionary *pickerDict;

/**
 省份数据数组
 */
@property (strong, nonatomic) NSArray *provinceArray;

/**
 城市数据
 */
@property (strong, nonatomic) NSArray *cityArray;

/**
 区数据
 */

@property (strong, nonatomic) NSArray *areaArray;

/**
 选中数据
 */
@property (strong, nonatomic) NSArray *selectedArray;


/**
 UIPickerView
 */
@property(strong, nonatomic)UIPickerView * pickerView;



@end

@implementation JJCityPicker


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubview];
    }
    return self;
}

#pragma 初始化
- (void)initSubview{
    [self getAddressData];

    [self addSubview:self.toolBar];

    [self addSubview:self.pickerView];
    
    @weakify(self);
    [self.toolBar setCommitBarBlock:^{
       @strongify(self);
        [[JJAlert shareInstance] hide];
        NSString * city = [NSString stringWithFormat:@"%@%@%@",[self.provinceArray objectAtIndex:[self.pickerView selectedRowInComponent:0]],[self.cityArray objectAtIndex:[self.pickerView selectedRowInComponent:1]],[self.areaArray objectAtIndex:[self.pickerView selectedRowInComponent:2]]];
        
        if ([self.delegate respondsToSelector:@selector(jjCityPicker:)]) {
            [self.delegate jjCityPicker:city];
        }
        
    }];
    
    [self.toolBar setCancelBarBlock:^{
        [[JJAlert shareInstance] hide];
    }];
    
}



- (void)dealloc
{
    NSLog(@"销毁了！");
}


#pragma 获取数据

- (void)getAddressData{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Address" ofType:@"plist"];
    self.pickerDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.provinceArray = [self.pickerDict allKeys];
    self.selectedArray = [self.pickerDict objectForKey:[[self.pickerDict allKeys] objectAtIndex:0]];
    
    if (self.selectedArray.count > 0) {
        self.cityArray = [[self.selectedArray objectAtIndex:0] allKeys];
    }
    
    if (self.cityArray.count > 0) {
        self.areaArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:0]];
    }
}




#pragma mark - UIPickerView Delegate


/**
设置有几个分区
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

/**
 设置每个分区有多少行，需要明确告诉在第几列中有多少行
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.provinceArray.count;
    } else if (component == 1) {
        return self.cityArray.count;
    } else {
        return self.areaArray.count;
    }
}

/**
设置每行的内容
  */
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [self.provinceArray objectAtIndex:row];
    } else if (component == 1) {
        return [self.cityArray objectAtIndex:row];
    } else {
        return [self.areaArray objectAtIndex:row];
    }
}

/**
 选中某一行触发方法（做三级联动）
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.selectedArray = [self.pickerDict objectForKey:[self.provinceArray objectAtIndex:row]];
        if (self.selectedArray.count > 0) {
            self.cityArray = [[self.selectedArray objectAtIndex:0] allKeys];
        } else {
            self.cityArray = nil;
        }
        if (self.cityArray.count > 0) {
            self.areaArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:0]];
        } else {
            self.areaArray = nil;
        }
    }
    [pickerView selectedRowInComponent:1];
    [pickerView reloadComponent:1];
    [pickerView selectedRowInComponent:2];
    
    if (component == 1) {
        if (self.selectedArray.count > 0 && self.cityArray.count > 0) {
            self.areaArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:row]];
        } else {
            self.areaArray = nil;
        }
        [pickerView selectRow:1 inComponent:2 animated:YES];
    }
    
    [pickerView reloadComponent:2];
}




#pragma setter and getter
- (JJToolBar *)toolBar
{
    if (!_toolBar) {
        _toolBar = [[JJToolBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,44)];
        _toolBar.backgroundColor = [UIColor whiteColor];
    }
    return _toolBar;
}

- (UIPickerView *)pickerView
{
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, ScreenWidth, 180)];
        _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    return _pickerView;
}



@end
