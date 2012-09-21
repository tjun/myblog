--- 
layout: post
title: "[Mac]lion\xE3\x81\xA7JAVA_HOME\xE3\x82\x92\xE8\xA8\xAD\xE5\xAE\x9A(jdk\xE3\x81\xAE\xE3\x82\xA4\xE3\x83\xB3\xE3\x82\xB9\xE3\x83\x88\xE3\x83\xBC\xE3\x83\xAB\xE3\x82\x82\xEF\xBC\x89"
wordpress_id: 944
wordpress_url: http://tjun.jp/blog/?p=944
date: 2011-09-25 18:10:14 +09:00
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
