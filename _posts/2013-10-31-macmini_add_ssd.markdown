---
layout: post
category: mac
title: Mac miniにSSDを増設した
date: 2013-10-31
description: Mac mini(late 2011)にSSDを増設したメモ
keywords: mac mini,ssd,増設
---

めっきり寒くなり、朝がつらい季節になってきました。

ちょっと前にOSXの最新バージョンMavericksがリリースされました。
ときどきOSをクリーンインストールしたくなる人間なので、このタイミングでMacbook AirとMac miniをMavericksクリーンインストールすることを決意しました。
その際に、Mac mini(SSDではない)の動作が遅くて気になること、家にSSDが1つ余っていること、そして確かMac miniにもう1台増設できること、を思い出したので、やり方を調べてみました。

自分のMac miniは Mid2011 という少し古いモデルなので、買った直後ならともかう今さらSSDにするのは本当にいいのか、少し悩みました。

#### SSDにするメリット
* Mac miniがさくさく動くようになるはず
* 容量が増える

#### SSDにする、デメリット、リスク
* めんどくさい
* お金がかかる
* 増設に失敗して最悪動かなくなるかも
* 元に戻せないと、中古で売れなくなるかも

上記のようなことを考えて、1年以上はMac miniが使いそうなことと、以外に安くできること（後述）が分かったので、増設することにしました。
リスクがあるのであんまりおすすめはしません。
自分も昔MacBookProの光学ドライブをハードディスクに交換するというのをやった時には、ディスプレイが映らなくなってGenius barで直してもらう羽目になったことがあります。

### 準備

増設するためには、SSDをつなぐためのケーブル等と、星形ネジを回すためのドライバが必要です。
自分は両方持っていなかったので、安いものを探してみると他のものは4000円ぐらいする中圧倒的に安いものがありました。

<a href="http://www.amazon.co.jp/exec/obidos/ASIN/B00CHFQZSC/tjun-22/ref=nosim/" target="_blank"><img src="http://ecx.images-amazon.com/images/I/41kwsZtzEDL._SL160_.jpg" alt="MAC Mini Server ２台目HDD/SSD増設用ケーブル Bottom Hard Drive Flex Cable for MAC Mini Server" /></a><br /><a href="http://www.amazon.co.jp/exec/obidos/ASIN/B00CHFQZSC/tjun-22/ref=nosim/" target="_blank">MAC Mini Server ２台目HDD/SSD増設用ケーブル Bottom Hard Drive Flex Cable for MAC Mini Server</a>

しかもドライバもセットでついててお得。
他のと比べてだいぶ安くて怪しいけど、まあいいやということでこれにしました。

あと、もちろんバックアップ取ったりしました。
SSDの方にMavericksを予めインストールしておきました。

### 作業

作業はこの辺などを参考にやりました。画像や動画を見てやった方がいいです。


* [Mac mini Mid 2011にSSDを増設した！ | DECHNIQUE](http://decoy284.net/2013/01/21/mav-mini-2011-mid-ssd-expansion/)

MacMiniの中身をほとんど全部取り外すことになります。

![MacMini](/blog/img/2013/10/macmini.jpg)

外すのも大変だけど、戻すのも結構大変でした。1時間以上かかってます。
組み立てが少しずれていてネジがちゃんと閉まらなかった場所あるけど、気にせずそのまま進めてます。
激安だった増設キットは、基本的には問題ないんですけど、SSDを固定するためのネジが4つあるうち2つが壊れてて使えないものでした。
ネジの先端の部分しかなくて、ドライバで回すことができない謎の部品でした。
そのため、SSDを枠にちゃんと固定できていません。
自分的にはまあ安かったしいいやという感じですが、心配な人はもっとちゃんとしたものを買うとよいと思います。

### 起動

これは動かないかもしれないと思ったけど、特に問題なく起動し、ディスクも2つ認識しました。
クリーンインストールの影響かSSDにした影響かはわからないけど、今のところ以前よりさくさく動いています。

快適になって満足ですが、やっぱり動かなくなる可能性を考えると、おすすめできないです。

