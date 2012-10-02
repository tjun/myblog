---
layout: post
status: publish
published: true
title: KestrelをJavaから利用する
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1067
wordpress_url: http://tjun.jp/blog/?p=1067
date: 2011-12-20 00:12:16.000000000 +09:00
categories:
- java
tags:
- java
- kestrel
comments: []
---
kestrelのセットアップについては以前の記事を参照してください。
<ul>
	<li><a href="http://tjun.jp/blog/2011/12/kestrel_setup/">Kestrelをcentosにセットアップ | tjun memo</a></li>
</ul>



以下では、JavaのプログラムからKestrelのキューを利用する方法を説明します。

Kestrelは、memcachedプロトコルで利用できるので、memcachedのライブラリなら基本的に大丈夫だと思います。
でも、kestrelに対応しているというところと、パフォーマンスがよさそうなところから、Xmemcachedというライブラリを利用します。

参考：
<ul>
	<li><a href="http://code.google.com/p/xmemcached/wiki/User_Guide#Talk_with_Kestrel">User_Guide - xmemcached - User Guide Version 0.3 - Extreme performance modern memcached client for java - Google Project Hosting</a></li>
</ul>



<h2>Xmemcachedのダウンロード</h2>
JavaプログラムからKestrelを利用するために、Xmemcachedというmemcached用のライブラリを利用します。
http://code.google.com/p/xmemcached/downloads/list　からxmemcached-1.3.5-bin-with-dependencies.tar.gz をダウンロードして利用します。


<h2>プログラム例</h2>
こんな感じで使えます。

{% highlight java linenos %}
import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.XMemcachedClientBuilder;
import net.rubyeye.xmemcached.command.KestrelCommandFactory;
import net.rubyeye.xmemcached.exception.MemcachedException;
import net.rubyeye.xmemcached.utils.AddrUtil;

(略)
{
    private XMemcachedClientBuilder builder = null;
    private MemcachedClient client = null;
    int expirationTime = 0;
    String queueName = "test";
    Striing host = "localhost";
    int port = "22133";
  
    builder = new XMemcachedClientBuilder(AddrUtil.getAddresses(host + ":" + port));
    builder.setCommandFactory(new KestrelCommandFactory());
    client = builder.build();

    client.set(queueName, expirationTime, "hello");

    String res = client.get(queueName);
    System.out.println(res);
}
{% endhighlight %}

参考：
<ul>
	<li><a href="http://code.google.com/p/xmemcached/wiki/Getting_Started#Talk_with_Kestrel">Getting_Started - xmemcached - Extreme performance modern memcached client for java - Google Project Hosting</a></li>
</ul>


エラーが出るときは、ketrelの設定を確認してみてください。

<a href="https://github.com/robey/kestrel/blob/master/docs/guide.md">docs/guide.md at master from robey/kestrel - GitHub</a>
