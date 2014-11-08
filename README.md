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

weibo:http://weibo.com/1881383360/profile?topnav=1&wvr=6<br>
Email:wazyq.cool@163.com

欢迎大家提出宝贵的建议或意见:)

<hr>

English Version
------------

DrawSector is a simple project that can you class `SectorView` to draw sectors with the provided percents.Each sector will take the rad as the percent is. And you can redraw the sectors as you will at any time.

<img width=150 src="https://raw.githubusercontent.com/GeneralZYQ/DrawSector-/master/SectorDemo/sectorWithPercents.png"/>
<img width=150 src="https://raw.githubusercontent.com/GeneralZYQ/DrawSector-/master/SectorDemo/sectorWithoutPercents.png"/>
<img width=150 src="https://raw.githubusercontent.com/GeneralZYQ/DrawSector-/master/SectorDemo/printResults1.gif"/>

How it works
-------------

In the process of painting, you can input the percents as you want and the cake diagram will draw with the percents.And each sector can display with a tilte to represent the value of the percent to the sector.

There is a sample project。

Example
------------
You can see how this project work with the following gif.

<img width=150 src="https://raw.githubusercontent.com/GeneralZYQ/DrawSector-/master/SectorDemo/example.gif"/>

Usage
---------------

1)put`SectorView` as a subview in the place you want it to be displayed. And set the original percents it should take and the frame.

```objc
    self.setcView = [[SectorView alloc] initWithPercents:@[@(15), @(15), @(60), @(10)]];
    self.setcView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 200);
    [self.view addSubview:_setcView];
```

2)set if `SectorView` should display the titles(in this example YES)

```objc
self.setcView.showTitles = YES;
```

3)set property `storeColors` of `SectorView` to dentify the colors of sectors

4)After the steps above. You can see the result

5）yes you can re set the percents of the secotr view. just invoke method`- (void)reConfigurePercents:(NSArray *)percents;`and`- (void)reDraw;` to achieve.

```objc
    [self.setcView reConfigurePercents:numbers];
    [self.setcView reDraw];
```

Requirements
---

This project uses ARC. If you are not using ARC in your project, add '-fobjc-arc' as a compiler flag for all the files in this project.

TODO
------------
I want animation for draw the sectors and set titles for each sector.

Contacts
----
weibo:http://weibo.com/1881383360/profile?topnav=1&wvr=6<br>
Email:wazyq.cool@163.com

Just feel free to contact me:)
