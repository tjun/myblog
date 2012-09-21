--- 
layout: post
title: "[Mac]JAVA_HOME/include\xE4\xBB\xA5\xE4\xB8\x8B\xE3\x81\xABjni.h\xE3\x81\x8C\xE3\x81\xAA\xE3\x81\x84\xE3\x81\xA8\xE3\x81\x84\xE3\x81\x86\xE3\x82\xA8\xE3\x83\xA9\xE3\x83\xBC\xE3\x82\x92\xE8\xA7\xA3\xE6\xB1\xBA"
wordpress_id: 941
wordpress_url: http://tjun.jp/blog/?p=941
date: 2011-09-25 18:07:00 +09:00
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
