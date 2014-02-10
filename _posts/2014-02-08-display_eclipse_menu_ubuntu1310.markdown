---
layout: post
category:
title: ubuntu13.10でeclipseのメニューが開けないのを直す
date: 2014-02-08
description: ubuntu13.10でなぜかeclipseのメニューが開けないので、開けるようにします。
keywords: ubuntu, eclipse
---

まずeclipseをダウンロードして、適当なところに置きます。

自分は /usr/local の下にeclipseのディレクトリを置きました。すると、 /usr/local/eclipse/eclipse から eclipseは起動できるようになったのですが、なぜかメニューバーからメニューを開こうとしても開けない状態になります。

その場合は、例えば /usr/local/bin/ に eclipse という名前で次のような中身のファイルを作ります。

    #!/bin/bash
    export UBUNTU_MENUPROXY=0
    /usr/local/eclipse/eclipse

最後の行は、eclipseを置いたpathに置き換えてください。
これで、 /usr/local/bin/eclipse から起動した eclipseにはメニューが表示されるようになります。

UbuntuのMenu Proxyというのと相性が悪いのかな。そのうち直るかもしれません。


参考：

* [Eclipse menus don't show up after upgrading to Ubuntu 13.10 - Stack Overflow](http://stackoverflow.com/questions/19452390/eclipse-menus-dont-show-up-after-upgrading-to-ubuntu-13-10)
