
![LYCircleView](https://raw.githubusercontent.com/liaoyuanng/LYCircleView/master/Resource/Logo.png)

`LYCircleView` 是一种常见的扇形(圆形)菜单, 我们经常在遥控器 App 中见到它。 `LYCircleView` 封装了一些最基础的功能和UI，并且提供了一些接口以供你自定义。

[For English](https://github.com/liaoyuanng/LYCircleView/blob/master/README.md)

# 使用

* 下载`LYCircleView`, 添加到你的工程。
* 导入 LYCircleView. 只需一行代码就能完成。
    
    ```
    LYCircleView *circleView = [[LYCircleView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:circleView]; // Emmmm...this can not be counted.😌
    ```
* 开黑吗🙃

# 安装

## 手动安装

[下载 LYCircleView](https://github.com/liaoyuanng/LYCircleView/archive/master.zip), 添加到你的工程中。

## CocoaPods

### Podfile

`pod 'LYCircleView', '~>0.0.1'`

运行：

`$ pod install`

# 使用

### 创建

```
LYCircleView *circleView = [[LYCircleView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
[self.view addSubview:circleView];
```

### 处理事件

继承 `LYCircleViewDelegate` 协议。

```
circleView.delegate = self;
```
实现协议中的方法。

```
- circleView: didClickedItem:
```

### 自定义

你可能需要自己设置UI属性。我提供了一些 API：

* normalAsset/normalAssets

    设置菜单每个按钮的图片，这俩个属性效果是一样的，只不过后者支持给每个按钮设置不同的图片，而前者是统一设置。
    
* selectedAsset/selectedAssets
    
    设置选中时的按钮图片，两者区别如上。

* highlightAsset/highlightAssets

    设置高亮时的图片，两者区别如上。
    
* backgroundColor/backgroundColors

    设置背景颜色，两者区别如上。
    
* itemInsert

    每个按钮的间距。

*提示: normalAsset/normalAssets, selectedAsset/selectedAssets, highlightAsset/highlightAssets 可以接受 UIColor 或者 UIImage 对象. 你可以在 Demo 中看到用法* 

![Demo Screenshot](https://github.com/liaoyuanng/LYCircleView/blob/master/Resource/screenshot.png?raw=true)

# License

LYCircleView is released under the MIT license. See [LICENSE](https://github.com/liaoyuanng/LYCircleView/blob/master/LICENSE) for details.


