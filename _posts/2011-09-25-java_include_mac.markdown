---
layout: post
status: publish
published: true
title: ! '[Mac]JAVA_HOME/include以下にjni.hがないというエラーを解決'
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
wordpress_id: 941
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

    cannot find jni.h in /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/include.

というエラーが出ました。

JAVA_HOMEの設定が設定されてなかったら先にやります．

- 参考 [Mac lionでJAVA_HOMEを設定 と jdkのインストール - tjun memo](http://tjun.org/blog/2011/09/lion_java_home/)

そして、


    $ sudo ln -s /Developer/SDKs/MacOSX10.7.sdk/System/Library/Frameworks/JavaVM.framework/Versions/A/Headers $JAVA_HOME/include

OSX Lionだと

    $ sudo ln -s /System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers $JAVA_HOME/include

これで解決すると思います。
