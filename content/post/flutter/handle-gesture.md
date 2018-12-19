---
title: "手势处理"
date: 2018-12-19T18:06:29+08:00
description: ""
author: "wanq"
authorAvatar: "./images/swift.jpg"
bannerRes: ""
categories: [flutter]
tags: [flutter]
draft: false
---
目前几乎所有的APP都会有用户的交互。实现交互的第一步是要检测用户输入的手势，接下来我们创建一个有交互的按钮
<!--more-->
```dart
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Flutter Tutorail',
  home: TutorialHome(),
));

class TutorialHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), tooltip: 'Navigation menu', onPressed: null),
        title: Text('Example title'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
      body: Center(
        child: MyButton(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class MyButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Button'),
        ),
      ),
    );
  }
}
```

`GestureDetector`部件没有视觉表现，而是检测用户的交互。
当用户点击`Container`时，`GestureDetector`会调用其`onTap`回调，在这种情况下会向控制台打印一条消息。您可以使用`GestureDetector`检测各种输入手势，包括点击，拖动和缩放。

演示：
![gesture widget demo](/post/flutter/QQ20181219-181901@2x.png)
![gesture widget consol demo](/post/flutter/QQ20181219-181918@2x.png)


[更多的 Gestures](https://flutter.io/docs/development/ui/advanced/gestures)



