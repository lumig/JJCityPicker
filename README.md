# JJCityPicker
城市选择三级联动


通过读取plist的文件实现省市区三级联动

调用方式

```
JJCityPicker *picker = [JJCityPicker new];
picker.delegate = self;
[[JJAlert shareInstance] showAnimationForCityPicker:picker];
```
这种方式的缺点是：plist获取的字典是无序的，要想实现第一个为指定的省市，如北京市，就有点麻烦。


通过读取xml文件实现省市区三级联动


