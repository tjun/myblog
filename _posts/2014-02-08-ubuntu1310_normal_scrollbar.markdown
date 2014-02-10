---
layout: post
category:
title: ubuntu13.10でスクロールバーを普通のやつにする
date: 2014-02-08
description: ubuntu13.10でスクロールバーがカーソル載せないと現れず不便なので、普通のやつに戻す
keywords: ubuntu
---

久しぶりにubuntuをインストールしました。
13.10 では、スクロールバーがカーソルを乗せないと現れなくて、個人的には使いにくいので普通のスクロールバーに戻します。
ターミナルを開いて以下を入力すれば戻せます。

    gsettings set com.canonical.desktop.interface scrollbar-mode normal

やっぱりデフォルトのやつに戻したい、という場合は

    gsettings set com.canonical.desktop.interface scrollbar-mode overlay-auto

とか

    gsettings reset com.canonical.desktop.interface scrollbar-mode

で戻せます。

aptでdconf-editorというのを入れるとGUIで変更できるらしい。

参考：

* [How to Disable Overlay Scrollbars in Ubuntu 13.10 Saucy | UbuntuHandbook](http://ubuntuhandbook.org/index.php/2013/10/disable-overlay-scrollbars-ubuntu13-10/)

