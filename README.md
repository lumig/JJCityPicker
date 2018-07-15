# JJCityPicker
城市选择三级联动


通过读取plist的文件实现省市区三级联动
调用方式
```
JJCityPicker *picker = [JJCityPicker new];
picker.delegate = self;
[[JJAlert shareInstance] showAnimationForCityPicker:picker];
```

