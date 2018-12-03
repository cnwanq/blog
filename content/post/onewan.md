---
title: "Hugo Theme - onewan"
date: 2018-12-02T00:41:37+08:00
description: "推荐一款自己开发的Hugo主题 - onewan"
author: "wanq"
authorAvatar: "./images/swift.jpg"
bannerRes: "onewan-wanq.me.png"
categories: [hugo]
tags: [theme]
---

# Hugo Theme - onewan
通过`Hugo`搭建这个站点后，就想着捣鼓一些不一样的东西，那么首先就从网站的样式上入手，就自己开发了这个主题`onewan`。
主题地址 [onewan theme](https://github.com/cnwanq/onewan)
<!--more-->

## 主题的结构
```
├── LICENSE
├── archetypes
│   └── default.md
├── data
├── i18n
├── layouts
│   ├── 404.html
│   ├── _default
│   │   ├── baseof.html
│   │   ├── list.html
│   │   └── single.html
│   ├── index.html
│   └── partials
│       ├── footer.html
│       └── header.html
├── static
│   ├── assets
│   │   ├── css
│   │   ├── fonts
│   │   ├── images
│   │   └── js
│   └── images
└── theme.toml
```

站点的配置文件如下
```
baseURL = "http://wanq.me/"
languageCode = "en"
title = "WanQ Notes"
theme = "onewan"

[Params]
subtitle = "生活 · 编程 · 思想"
github = "https://github.com/cnwanq"
profile = "/images/swift.png"
copyright = "Copyright © 2018 WanQ All rights reserved."
banner = "/images/2012021709492293.jpg"

[permalinks]
  post = "/:year/:month/:title/"

# 支持动态扩展菜单
# [Menu]
#   [[Menu.main]]
#     name = "文章"
#     url = "/post/"
#     weight = 1
#   [[Menu.main]]
#     name = "关于我"
#     url = "/about/"
#     weight = 2
```

**目前支持：**

* 网站首页
* 文档明细页
* 动态扩展菜单

**接下来计划：**

* 近期文章
* 归档功能
* 分类列表
* 标签列表
* 评论
* 搜索
