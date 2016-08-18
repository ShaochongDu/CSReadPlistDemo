# CSReadPlistDemo
通过plist文件读取配置信息

![image](https://github.com/ShaochongDu/CSReadPlistDemo/raw/master/CSReadPlistDemo/Resource/Image//DemoScreenShot.gif)

通过配置plist文件快速生成设置类的tableview列表页

```
1. 获取分组列表(参考 ViewController)
self.dataSourceArray = [CSPlistTool loadGroupPlistFile:@"GroupItem.plist"];

2. 获取单个分组列表 (参考 SingGroupViewController)
self.dataSourceArray = [CSPlistTool loadItemPlistFile:@"ItemList.plist"];

```
