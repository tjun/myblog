---
layout: post
status: publish
published: true
title: Kestrelをインストールしたメモ
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1066
wordpress_url: http://tjun.jp/blog/?p=1066
date: 2011-12-20 00:01:05.000000000 +09:00
categories:
- centos
tags:
- java
- kestrel
- centos
comments:
- id: 352
  author: KestrelをJavaから利用する | tjun memo
  author_email: ''
  author_url: http://tjun.jp/blog/2011/12/kestrel-java/
  date: '2011-12-20 00:12:19 +0900'
  date_gmt: '2011-12-19 15:12:19 +0900'
  content: ! '[...] Kestrelをcentosにセットアップ | tjun memo     以下では、JavaのプログラムからKestrelのキューを利用する方法を説明します。  Kestrelは、memcachedプロトコルで利用できるので、memcachedのライブラ
    [...]'
---

2013/02/01 に修正した時点のものです、最新のものがあるかもしれないので確認してください。

Kestrelは、<a href="http://blog.twitter.com/2009/01/building-on-open-source.html" target="_blank">twitterが使ってるらしい</a>メッセージキューです。

<h2>前準備</h2>

まずgitが必要となるので、gitを使えるようにしてください。
Javaも必要となります。使用するユーザでJAVA_HOMEを設定しておいてください。


## kestrelのインストール

次はkestrelをインストールします。


kestrelを/usr/local/kestre以下にインストールします。
まずは最新版をダウンロード。2013/02/01では2.4.1でした。

    wget http://robey.github.com/kestrel/download/kestrel-2.4.1.zip

解凍して、/usr/local/kestrel以下にコピーする。
最新のものに対して、 /usr/local/kestrel/currentにシンボリックリンクを作る。

    mkdir /usr/local/kestrel
	unzip kestrel-2.4.1.zip
    cp -R /kestrel-2.4.1 /usr/local/kestrel/
    ln -s /usr/local/kestrel/kestrel-2.4.1 /usr/local/kestrel/current

必要なディレクトリを作っておく。

    mkdir /var/log/kestrel
    mkdir /var/run/kestrel

実行するユーザが書き込めるように適宜パーミッションを修正してください。


## kestrelの実行

ここまでが全てうまく行っていれば、

    /usr/local/kestrel/current/script/kestrel.sh start

で実行できます。
止めるときは、

    /usr/local/kestrel/current/script/kestrel.sh stop


kestrel.sh内のHeapサイズが4Gとなっているので、動かない場合はそこを調整してみてください。
サイズを変更するときは、kestrel.shの

`HEAP_OPTS="-Xmx1024m -Xms128m -XX:NewSize=128m"`
を
`Xmx=512 Xms=128 newsize=128`　くらいにする

直接jarを叩いて実行もできます。
`java -jar /usr/local/kestrel/current/kestrel-2.0.0-SNAPSHOT.jar`

## 動作確認

kestrelを起動したら、telnetで接続して動作を確認します。

    $ telnet 127.0.0.1 22133
    Trying 127.0.0.1...
    Connected to 127.0.0.1.
    Escape character is '^]'.
    STATS
    STAT uptime 185
    STAT time 1295254423
    STAT version 1.2.9-SNAPSHOT
    STAT curr_items 0

以上です。


参考にしたページ：
<ul>
	<li><a href="http://martincozzi.blogspot.com/2011/01/how-to-install-kestrel-on-ubuntu-1004.html">Martin Cozzi: How to install Kestrel on Ubuntu 10.04</a></li>
	<li><a href="http://d.hatena.ne.jp/yuroyoro/20090803/1249297348">twitterでも利用されているメッセージキュー Kestrelを試す - ゆろよろ日記</a></li>

</ul>
