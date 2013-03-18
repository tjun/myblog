---
layout: post
status: publish
published: true
title: ! '[Mac]lionでJAVA_HOMEを設定(jdkのインストールも）'
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 944
wordpress_url: http://tjun.jp/blog/?p=944
date: 2011-09-25 18:10:14.000000000 +09:00
categories:
- programming
- mac
tags:
- mac
- java
comments:
- id: 331
  author: ! '[Mac]JAVA_HOME/include以下にjni.hがないというエラーを解決 | tjun memo'
  author_email: ''
  author_url: http://tjun.jp/blog/2011/09/java_include_mac/
  date: '2011-09-25 18:11:16 +0900'
  date_gmt: '2011-09-25 09:11:16 +0900'
  content: ! '[...] in /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/include.
    というエラーが出ました。  JAVA_HOMEの設定は済んでいるとして、 （参考 [Mac]lionでJAVA_HOMEを設定(jdkのインストールも） |
    tjun memo） [...]'
---
LionではJDKが予めインストールされている？かもしれません。
ターミナルで
<pre>
$ java -version
</pre>
が出来れば入っていると思います。

その場合、~/.bashrcなどに
[bash]
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
[/bash]
を追記して再読み込みすれば、JAVA_HOMEが反映されます。
<pre>
$ source ~/.bashrc
</pre>

javaがなければ、
http://support.apple.com/downloads/#Java
からダウンロードしてインストールできます。
