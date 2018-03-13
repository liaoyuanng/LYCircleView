
![LYCircleView](https://raw.githubusercontent.com/liaoyuanng/LYCircleView/master/Resource/Logo.png)

`LYCircleView` is a common fan-shaped menu, often used for remote control. `LYCircleView` provides some commonly used functions and you can custom UI by yourself.

[中文介绍](https://github.com/liaoyuanng/LYCircleView/edit/master/README_zh.md)

# Get Started

* Download `LYCircleView`, add `LYCircleView` file to your project.
* import LYCircleView. Just one line of code。
    
    ```
    LYCircleView *circleView = [[LYCircleView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:circleView]; // Emmmm...this can not be counted.😌
    ```
* Enjoy.

# Installation

## Manual

[Download LYCircleView](https://github.com/liaoyuanng/LYCircleView/archive/master.zip), and add `LYCircleView` file to your project.

## CocoaPods

### Podfile

`pod 'LYCircleView', '~>0.0.1'`

Then, run the following command:

`$ pod install`

Enjoy.

# Usage

### create a circle menu

```
LYCircleView *circleView = [[LYCircleView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
[self.view addSubview:circleView];
```

### handle events

Inherit `LYCircleViewDelegate` protocol.

```
circleView.delegate = self;
```
and implement protocol.

```
- circleView: didClickedItem:
```

### custom

Maybe, you need custom UI by yourself. LYCirlceView provides some attributes.

* normalAsset/normalAssets

    Set menu items image.This two properties have the same effect. `normalAsset` is convenient property. It will affect all items. When you want to set a different image for each item, you can use `normalAssets`.
    
* selectedAsset/selectedAssets
    
    Set global/single item selected state image.

* highlightAsset/highlightAssets

    Set global/single item highlight state image.
    
* backgroundColor/backgroundColors

    Set global/single item background color.
    
* itemInsert

    Set spacing between each item.
    

*NOTE: normalAsset/normalAssets, selectedAsset/selectedAssets, highlightAsset/highlightAssets can accept UIImage or UIColor objects. see more in demo* 

![Demo Screenshot](https://github.com/liaoyuanng/LYCircleView/blob/master/Resource/screenshot.png?raw=true)

# License

LYCircleView is released under the MIT license. See [LICENSE](https://github.com/liaoyuanng/LYCircleView/blob/master/LICENSE) for details.


