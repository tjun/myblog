---
layout: post
status: publish
published: true
title: ! '[Mac]JAVA_HOME/include以下にjni.hがないというエラーを解決'
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 941
wordpress_url: http://tjun.jp/blog/?p=941
date: 2011-09-25 18:07:00.000000000 +09:00
categories:
- programming
- mac
tags:
- mac
- java
comments: []
---
Mac OSX (lion)で、とあるconfigureスクリプトを実行中に
<pre>cannot find jni.h in /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/include.</pre>
というエラーが出ました。

JAVA_HOMEの設定は済んでいるとして、
（参考 <a href="http://tjun.jp/blog/2011/09/lion_java_home/" title="[Mac]lionでJAVA_HOMEを設定(jdkのインストールも） | tjun memo">[Mac]lionでJAVA_HOMEを設定(jdkのインストールも） | tjun memo</a>）
<pre>
$ sudo ln -s /Developer/SDKs/MacOSX10.7.sdk/System/Library/Frameworks/JavaVM.framework/Versions/A/Headers $JAVA_HOME/include
</pre>

Lionだと
<pre>
$ sudo ln -s /System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers $JAVA_HOME/include
</pre>
これで解決すると思います。
