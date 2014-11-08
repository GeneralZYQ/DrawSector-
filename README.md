DrawSector-
===========

Chinese Version:

简介
------------

DrawSector 是一个简单的可以按照一定的比例绘制半圆形饼状图的iOS应用。并且可以使用这个应用显示饼图中每一部分所代表的意义。

<img width=150 src="https://raw.githubusercontent.com/GeneralZYQ/DrawSector-/master/SectorDemo/sectorWithPercents.png"/>
<img width=150 src="https://raw.githubusercontent.com/GeneralZYQ/DrawSector-/master/SectorDemo/sectorWithoutPercents.png"/>
<img width=150 src="https://raw.githubusercontent.com/GeneralZYQ/DrawSector-/master/SectorDemo/printResults1.gif"/>

如何工作
-------------

在绘制饼状图过程中，应用按照用户输入的百分比使用一定的颜色排布在半圆形中进行绘制。从而达到可以正确显示每一部分所代表的比例大小的目的。用户可以按照自己的方式输入新的值从而重新绘制饼状图，并且可以对每一部分的百分比值进行显示。

这里有一个简单的工程。

示例
-------------

可以通过如下的gif图像获得该工程的使用示例:)

<img width=150 src="https://raw.githubusercontent.com/GeneralZYQ/DrawSector-/master/SectorDemo/example.gif"/>

使用方法
---------------

1)在需要展示饼状图的地方将`SectorView`作为子View加入到该处,并且配置SectorView最初需要显示的各部分所占的百分比，设置`frame`

```objc
    self.setcView = [[SectorView alloc] initWithPercents:@[@(15), @(15), @(60), @(10)]];
    self.setcView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 200);
    [self.view addSubview:_setcView];
```

2)设置`SectorView`是否需要显示扇面标题(该示例中设置为显示)

```objc
self.setcView.showTitles = YES;
```

3)可在`SectorView`类中通过设置`storeColors`数组的元素来配置每个扇面显示的颜色。

4)这时可以得到需要显示的效果了。

5）如果需要让扇面重新绘制为按照新的比例显示，则需要调用`- (void)reConfigurePercents:(NSArray *)percents;`和`- (void)reDraw;`方法来完成

```objc
    [self.setcView reConfigurePercents:numbers];
    [self.setcView reDraw];
```

要求
------------
本工程采用ARC，如果您的工程未采用ARC模式，请在您的工程中为所有从本工程中引用的文件添加'-fobjc-arc'编译标签。

TODO
-------------
未来会加入支持动态绘制扇面，更改每个扇面标题等功能。

联系方式
-------------

weibo:http://weibo.com/1881383360/profile?topnav=1&wvr=6
Email:wazyq.cool@163.com

欢迎大家提出宝贵的建议或意见:)
