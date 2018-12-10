---
title: "Dart 入门"
date: 2018-12-10T23:12:23+08:00
description: ""
author: "wanq"
authorAvatar: "./images/swift.jpg"
bannerRes: ""
categories: [dart]
tags: [dart]
draft: false
---
> 一门新的开发语言，由`Google`开发，因为`Flutter`这门技术，被大家开始关注起来

# Dart Get Started

[官方 Get Started](https://www.dartlang.org/)
[在线 Dard 编译器](https://dartpad.dartlang.org/)


## Dart 安装

安装环境
```shell
brew tap dart-lang/dart
brew instal dart
# 如果要开发web应用，需要安装 Dartium 和 Content Shell
brew tap dart-lang/dart
brew install dart --with-content-shell --with-dartium
```

安装开发版本
```shell
brew install dart --devel
```

更新
```shell
brew update
brew upgrade dart
brew cleanup dart
```

## Dart 应用程序

Dart 应用程序至少包含：
* 一个 Dart 源程序，以 .dart 为后缀名，包含 Dart 代码的文件
* 一个顶级 main() 函数。应用程序的入口点

有两种类型的 Dart 应用程序：命令行应用程序 和 Web应用程序。
一个命令行应用程序是一个独立的程序，命令行运行在 Dart 虚拟机的一个终端窗口。
Web应用程序托管在一个 Web 页面，运行在浏览器中。

## Hello world

```Dart
say(String who) {
  print('Hello $who.'); // 在控制台中打印内容
}

main() {
  var toSay = "Dart";
  say(toSay);
}
```