---
title: "客户端如何同步服务端时间"
date: 2018-12-03T17:59:06+08:00
description: "为大家分享真实的项目遇到的问题"
author: "wanq"
authorAvatar: "./images/swift.jpg"
bannerRes: ""
categories: [开发]
tags: [开发]
draft: false
---
开发过程中，有些业务场景对时间的要求会比较严谨，需要限定时间的精确度、或者时间的范围，不符合就不能正常的执行下去。比如：倒计时，待支付，抢购活动。  
这样就需要一个方案来解决服务端与客户端时间的同步，确保业务的正常进行。


突然想起年少时玩的网游**石器时代**，有种作弊的方式是通过电脑启动一款软件**变速齿轮**，修改电脑中程序运行的倍数，来改变正常的游戏节奏。
<!--more-->

> 变速齿轮: 首先，变速齿轮改变的是应用程序（一般是游戏）的速度，而不是操作系统的。一些游戏中的时间不使用系统提供的实际时间，而是采用与程序所占用的 CPU 时间相关的某个逻辑时间，比如事件循环每 n 次算一个单位时间，或者画面重画一次算一个单位时间。这一计算时间的方式多见于早期的电子游戏，不使用系统提供的时间的理由多为 API 支持不完善，不能获取足够精确的时间，而在多媒体应用中，获取高精度时间有时是很必要的。

假如游戏中加入了时间校验，那么可以通过服务端检验客户端的时间，预防通过改变客户端时间产生的问题。

## 那么如何确定这个方案呢？

假设一个需求：有个抢购的活动，中午12点开抢。

一个活动界面有个抢购的按钮，12点后可以点击抢购，12点前灰置不可以点击。  
那么开发人员可能会这样编写该逻辑

## 方案一
```
let button = new button();
button.disable = yes;

let time = new date(); // 获取系统当前的时间
if (time >= 12:00) {
    button.disable = no;
}
```

通常来说，这代码不会有问题，但是如果用户修改了系统的时间，将系统时间提前了一小时，界面上就可以提前点击抢购按钮。

问题发现了，是可以调整系统时间影响功能。


## 方案二
如果不用客户端本地时间，那么需要引入服务端的时间，服务端提供接口返回服务端当前的时间。

这样代码就可能变成
```
let button = new button();
button.disable = yes;

let time = getServerTime(); // 获取系统当前的时间
if (time >= 12:00) {
    button.disable = no;
}

function getServerTime() {
    // by http reqest server
    return serverTime;
}

```

如果客户端每次需要判断时间，都调用该接口的话，由于网络请求的延迟，这个时间也不是很准确的，另外会对服务端造成一定的压力。严重的话就产生DDOS攻击。


防止一个终端频繁请求服务器获取服务端的时间，那么可不可能只需要获取一次服务器的时间。剩下的就让客户端处理呢。

## 方案三

其实合理的做法就是客户端只需要同步一次服务端的服务器时间，然后将获取到的服务器与终端的一个绝对时间作为参考。要获取最新的服务段时间，可以不用请求服务器，通过参考的绝对时间与现在的这个时间做个减法，将结果添加到之前保存的服务端的时间，就得到最新的服务器时间。

**步骤**
* 启动同步服务器时间，并保存至内存
* 取当前系统绝对时间，作为参考绑定同步的服务器时间，保存该系统绝对时间
* 获取新的服务器时间，取新的当前系统时间，比对之前系统时间，得到偏移量
* 将保存的服务器时间加上偏移量，得到新的服务器时间

伪代码来一段
```
let button = new button();
button.disable = yes;

let serverTime;
let systemTime;

syncServerTime();

time = getCurrentTime();
if (time >= 12:00) {
    button.disable = no;
}


function syncServerTime() {
    serverTime = getServerTime(); // 获取系统服务器时间
    systemTime = getSystemTime(); // 获取客户端系统，不可修改，休眠
}

function getCurrentTime() {
    currentSystemTime = getSystemTime();
    let diff = currentSystemTime - systemTime;
    return serverTime + diff;
}


function getServerTime() {
    // by http reqest server
    return serverTime;
}

function getSystemTime() {
    // get machine time, don't get system time;
}

```

## 总结

**需要注意**
获取系统时间的方法，一定要是不能系统的时间，系统时间可以修改；iOS上不要获取进程的运行时间，进程会睡眠，导致该时间会变小，影响最终结果。

为什么写这个，是因为这个隐晦的问题（系统睡眠，进程运行时间停止），之前一直没有发现。导致造成了一些问题。

以上分享该经验，希望可以帮组需要的小伙伴。

### 推荐一篇文章
[iOS获取时间的方法](https://everettjf.github.io/2018/08/07/get-current-time-on-ios-platform/)
