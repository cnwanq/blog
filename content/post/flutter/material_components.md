---
title: "使用 Material 部件"
date: 2018-12-19T17:36:25+08:00
description: ""
author: "wanq"
authorAvatar: "./images/swift.jpg"
bannerRes: ""
categories: [flutter]
tags: [flutter]
draft: false
---
Flutter 提供的组件都遵循 Google 的 Material Design。一个 Material App 都是从 `MaterialApp` widget 开始，并且会包含一个导航 `Navigator`。

看代码实例:
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
        child: Text('Hello, world!'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
```


运行结果
![hello demo](/post/flutter/QQ20181219-174955@2x.png)


[更多的 material components](https://flutter.io/docs/development/ui/widgets/material)
