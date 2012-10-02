---
layout: post
status: publish
published: true
title: プログラムの行数をかぞえる
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 176
wordpress_url: http://tjun.jp/blog/?p=176
date: 2009-12-03 02:10:24.000000000 +09:00
categories:
- programming
- linux
- mac
tags:
- programming
- linux
comments: []
---
忘れていたのでメモ。

たとえばc言語で，ディレクトリに**.hだとか**.cだとかを複数おいているときに，

ターミナルで

<pre>
$ wc -l *.[hc]
</pre>
とやると複数のプログラムの行数をまとめて数えることができる。．

c言語じゃなければ，
<pre>
$ wc -l *.java
</pre>
とか．

wcはワードカウント． -l（小文字のエル）オプションは行数だけ，という意味だと思う．今度からたまに使ってみる．
