---
title: "基本 Widgets"
date: 2018-12-19T16:53:50+08:00
description: ""
author: "wanq"
authorAvatar: "./images/swift.jpg"
bannerRes: ""
categories: [flutter]
tags: [flutter]
draft: false
---
`Flutter`有一套非常灵活的基本的`widget`。经常会用到的有：
* Text: 文本部件可以创建一系列样式的文本
* Row, Column: 布局部件，横向布局与垂直布局。借鉴与 web 里面的 flex 布局
* Stack: 布局部件，允许按照部件添加顺序堆叠咋一起。可以通过分别设置上左下右，来调整位置。
* Container: 容器部件，创建矩形可视元素。可以使用BoxDecoration装饰容器，例如背景，边框或阴影。 Container也可以在其大小上应用边距，填充和约束。另外，可以使用矩阵在三维空

下面是一些简单的小部件 demo，它们结合了这些小部件和其他小部件：
```dart
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.0,
      padding: const EdgeInsets.fromLTRB(8, 44, 8, 0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'My app',
    home: MyScaffold(),
  ));
}
```
运行界面
![basic widget demo](/post/flutter/QQ20181219-172802@2x.png)

