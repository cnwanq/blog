---
title: "Hello Hugo"
description: "Hugo 是一个非常好的文档建站工具"
date: 2018-11-30T11:59:00+08:00
author: "wanq"
authorAvatar: "./images/swift.jpg"
bannerRes: "hugo-banner.png"
---

> 本博客是有`Hugo`搭建的，那么首先就来介绍下如何使用`Hugo`快捷的搭建博客网站

# Hello Hugo

`Hugo`是什么呢？
`Hugo`是由`Go`语言实现的静态网站生成器。简单、易用、高效、易扩展、快速部署。  
这是它的网址 [Hugo Link](https://gohugo.io/)
<!--more-->

## 安装Hugo

`macOS`系统通过`Homebrew`安装
```bash
brew install hugo
```

`Windows`系统可以通过`Chocolatey`或者`Scoop`包管理工具安装
```bash
# by Chocolatey
choco install hugu -confirm

# by Scoop
scoop install hugo
```

## 创建站点
通过`hugo`生成站点，比如希望生成到`/path/to/site`路径
```bash
hugo new site /path/to/site
```

这个样就在`/path/to/site`目录生成了初始站点。

## 创建文章
创建一个`about`页面
```bash
hugo new about.md
```

创建一篇文章，放在`post`目录，方便之后生成聚合页面
```bash
hugo new post/hello.md
```

## 安装主题
可以在[Hugo Themes]选择一个合适的主题进行安装，这里我们安装`hyde`主题
```bash
cd themes
git clone https://github.com/spf13/hyde.git
```

## 运行Hugo
在你的站点根目录执行`Hugo`命令进行调试
```bash
hugo server -t hyde -D
```

浏览器里打开：`http://localhost:1313`

## 发布部署
通过`Hugo`命令生成静态的页面代码
```bash
hugo -t hyde
```


