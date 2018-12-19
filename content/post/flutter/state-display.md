---
title: "flutter - 状态显示"
date: 2018-12-19T18:37:18+08:00
description: ""
author: "wanq"
authorAvatar: "./images/swift.jpg"
bannerRes: ""
categories: [flutter]
tags: [flutter]
draft: false
---
前面，我们用到的都是无状态的部件，接下来我们要接触有状态的部件。
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
        child: Counter(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class Counter extends StatefulWidget {

  @override
  State createState() {
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  
  void _increment() {
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: _increment,
          child: Text('Increment'),
        ),
        Text('Count: $_counter'),
      ],
    );
  }
}
```

运行结果
![hello demo](/post/flutter/QQ20181219-184900@2x.png)
