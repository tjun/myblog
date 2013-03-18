---
layout: post
category: 
title: Ubuntu12.04でWindowサイズを変えるのが難しい
date: 2012-11-10
summary: Ubuntu12.04でWindowをドラッグして大きくするのが難しいのを直す方法を紹介
keywords: ubuntu, window, 12.04
---

いつからなのか分からないけど、Ubuntuでウィンドウのはじっこをドラッグして拡大・縮小するのがとても難しい。はじっこと判定してくれる部分がとても小さくて、ちょっとでもマウスがズレるとダメという無茶な精度を要求してくる。

これを解決するには、

/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml

を開いて（sudoが必要）

    ...
    <distance name="left_width" value="1"/>
    <distance name="right_width" value="1"/>
    <distance name="bottom_height" value="1"/>
    ...

となっているところを

    <distance name="left_width" value="5"/>
    <distance name="right_width" value="5"/>
    <distance name="bottom_height" value="5"/>

くらいに変更してログインし直すと改善されます。

### 参考

* [Ubuntu日本語フォーラム / ウインドウ境界のマウスの感度](https://forums.ubuntulinux.jp/viewtopic.php?id=12518)

