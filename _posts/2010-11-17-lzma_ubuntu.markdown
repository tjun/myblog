---
layout: post
status: publish
published: true
title: ubuntuでlzma.h(圧縮)を使う
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 674
wordpress_url: http://tjun.jp/blog/?p=674
date: 2010-11-17 12:54:17.000000000 +09:00
categories:
- programming
- ubuntu
tags:
- ubuntu
comments: []
---
<p>lzma (xz) っていうのは、圧縮アルゴリズムの中でも、圧縮にかかる時間は長いけど、圧縮率がbzip2より高くて伸長にかかる時間が比較的短いっていう特徴があります。tarのバージョン1.22からは対応しているらしい。

<a href="http://codezine.jp/article/detail/3658">GNU tar 1.22リリース　gzipより圧縮効率が大きく向上した「xz」をサポート：CodeZine</a>


普通にコマンドラインから利用するだけなら
<pre>
sudo aptitude install lzma lzma-dev 
</pre>
でインストールされて、コマンドラインからは使えると思う。


プログラムから利用するときは lzma.hが欲しいのだけど、調べたら
<pre>
$ sudo apt-get install xz-utils liblzma-dev
</pre>
でいけるらしい。でも、自分の使ってるubuntuサーバ(8.04)ではそんなパッケージがないみたいなので、ソースからインストールした。

<pre>
wget http://tukaani.org/xz/xz-5.0.0.tar.gz
tar zxvf xz-5.0.0.tar.gz 
cd xz-5.0.0/
./configure
make
make check
sudo make install
</pre>

/usr/local/include/以下にlzma.h がインストールされます。

lzma.hを利用したプログラムは
<a href="http://s-yata.jp/docs/xz-utils/">XZ Utils の使い方</a>
に詳しい説明があるので、参考になります。

関連：
・<a href="http://tukaani.org/xz/">XZ Utils</a>
・<a href="http://www.7-zip.org/sdk.html">LZMA SDK (Software Development Kit)</a>
