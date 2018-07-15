//
//  ViewController.m
//  JJCityPicker
//
//  Created by jessie on 2018/7/14.
//  Copyright © 2018年 luming. All rights reserved.
//

#import "ViewController.h"

#import "JJCityPicker.h"
#import "CAppConfig.h"
#import "JJAlert.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,JJCityPickerDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubview];
    

    
}

#pragma 初始化

- (void)initSubview{
    self.title = @"三级联动";
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.tableView];
    self.dataArray = @[@"地址选择"];
    
}


#pragma JJCityPickerDelegate
- (void)jjCityPicker:(NSString *)city
{
    NSLog(@"选中的城市啊============= %@",city);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            JJCityPicker *picker = [JJCityPicker new];
            picker.delegate = self;
            [[JJAlert shareInstance] showAnimationForCityPicker:picker];
        }
            break;
            
        default:
            break;
    }
    
}


#pragma setter and getter 
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
