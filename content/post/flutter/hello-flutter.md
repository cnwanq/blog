---
title: "flutter - Hello"
date: 2018-12-19T15:31:08+08:00
description: ""
author: "wanq"
authorAvatar: "./images/swift.jpg"
bannerRes: ""
categories: [flutter]
tags: [flutter]
draft: false
---

# Flutter 是什么？
Flutter 作为谷歌最近推出的跨平台开发框架，一经推出便吸引了不少注意。关于 Flutter，目前我们知道它是一个跨平台开发框架。但是它本身并不止于此，例如 Fuchsia、Dart 等，我们也都需要去了解。

> 这里不打算介绍如何在不同的平台安装 Flutter。

[flutter 入口](https://flutter.io/)  
[flutter 安装入口](https://flutter.io/docs/get-started/install)

目前 flutter 支持的开发工具有 xcode、 android studio、idea 和 vscode。个人推荐使用 android studio，为什么？因为开发体验好！
<!--more-->
## 创建 flutter 项目
加入我们即将创建一个项目 `hello_flutter`。所以我们需要先在确认好的 `workspace` 的路径。然后在输入创建命令：
```dart
flutter create hello_flutter
```
用 android studio 打开项目文件。
![项目结构](/post/flutter/QQ20181219-155559@2x.png)

在目录 `lib` 有个文件 `main.dart` 程序的入口文件，其中有 `main` 方法。

创建好的 `main.dart` 文件如下：
```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
```

其中 `main` 方法用到了胖箭头
```dart
void main() => runApp(MyApp());
```
等价于
```dart
void main() {
  runApp(MyApp());
}
```

接下来我们修改下最简单的 `Hello` 程序
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
```
`runApp`里面放置`Widget`小部件，上面的例子中有两个`Widget`，分别是`Center`与`Text`。

运行结果
![hello demo](/post/flutter/QQ20181219-160652@2x.png)

在编写应用程序时，通常会创建作为`StatelessWidget`或`StatefulWidget`的子类的新窗口小部件，具体取决于窗口小部件是否管理任何状态。小部件的主要工作是实现构建函数，该函数根据其他较低级别的小部件描述小部件。框架依次构建这些小部件，直到该过程在代表底层`RenderObject`的小部件中达到最低点，该小部件计算并描述小部件的几何形状。
