--- 
layout: post
title: "Kestrel\xE3\x82\x92Java\xE3\x81\x8B\xE3\x82\x89\xE5\x88\xA9\xE7\x94\xA8\xE3\x81\x99\xE3\x82\x8B"
wordpress_id: 1067
wordpress_url: http://tjun.jp/blog/?p=1067
date: 2011-12-20 00:12:16 +09:00
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

[code lang="java"]
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
    String queueName = &quot;test&quot;;
    Striing host = &quot;localhost&quot;;
    int port = &quot;22133&quot;;
  
    builder = new XMemcachedClientBuilder(AddrUtil.getAddresses(host + &quot;:&quot; + port));
    builder.setCommandFactory(new KestrelCommandFactory());
    client = builder.build();

    client.set(queueName, expirationTime, &quot;hello&quot;);

    String res = client.get(queueName);
    System.out.println(res);
}
[/code]

参考：
<ul>
	<li><a href="http://code.google.com/p/xmemcached/wiki/Getting_Started#Talk_with_Kestrel">Getting_Started - xmemcached - Extreme performance modern memcached client for java - Google Project Hosting</a></li>
</ul>


エラーが出るときは、ketrelの設定を確認してみてください。

<a href="https://github.com/robey/kestrel/blob/master/docs/guide.md">docs/guide.md at master from robey/kestrel - GitHub</a>
