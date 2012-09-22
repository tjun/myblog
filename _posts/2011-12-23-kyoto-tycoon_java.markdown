---
layout: post
status: publish
published: true
title: Kyoto TycoonをJavaから利用する
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1065
wordpress_url: http://tjun.jp/blog/?p=1065
date: 2011-12-23 21:51:42.000000000 +09:00
categories:
- db
- java
tags:
- db
- server
- kyoto_tycoon
- centos
comments: []
---
Kyoto tycoonのセットアップは、以前のエントリを参照
<ul>
	<li><a href="http://tjun.jp/blog/2011/12/kyototycoon_setup/">kyoto tycoonをcentosにセットアップ | tjun memo</a></li>
</ul>


<h2>Kyoto Tycoonの起動</h2>
memcachedプラグインを有効にして起動します。
<pre>ktserver -plsv /usr/local/libexec/ktplugservmemc.so -plex 'port=22222' test.kch</pre>

Xmemcachedというライブラリを使います。
参考：
<ul>
	<li><a href="http://code.google.com/p/xmemcached/wiki/User_Guide#Talk_with_Kestrel">User_Guide - xmemcached - User Guide Version 0.3 - Extreme performance modern memcached client for java - Google Project Hosting</a></li>
</ul>

<h2>Xmemcachedのダウンロード</h2>
JavaプログラムからKestrelを利用するために、Xmemcachedというmemcached用のライブラリを利用します。
http://code.google.com/p/xmemcached/downloads/list　からxmemcached-1.3.5-bin-with-dependencies.tar.gz をダウンロードして利用します。



利用プログラム例
[java]
String hostname = "localhost";
String port = "22222";
int expiration_time = 0;

XMemcachedClientBuilder builder = new XMemcachedClientBuilder(
        AddrUtil.getAddresses(hostname + ":" + port));
builder.setTranscoder(new TokyoTyrantTranscoder());
MemcachedClient client = builder.build();

ArrayList<String> keylist = new ArrayList<String>();

try{
    // set data
    System.out.println("set data");
　　　    for(Integer i = 0; i != 5; i++){
　　　　    String value = "value" + i;
        client.set(i.toString() , expiration_time, value);
        keylist.add(i.toString());
    }    

    // get data

    // bulk get
    System.out.println("bulk get");
    Map<String, Object> valuemap = client.get(keylist);
    for(Integer i =0; i != 5; i++){
        System.out.println(valuemap.get(keylist.get(i)));            
    }

    // single get
    System.out.println("single get");
    for(Integer i=0; i != 5; i++){
        String value = client.get(i.toString());
        System.out.println(value);
    }

　　　　// delete data
        System.out.println("delete data from db");

    for(Integer i=0; i != 5; i++){
        client.delete(i.toString());
    }

} catch (TimeoutException e) {
    // memcached operation timeout
    e.printStackTrace();
} catch (InterruptedException e) {
    // ignore
    //e.printStackTrace();
} catch (MemcachedException e) {
    // memcached operation fail
    e.printStackTrace();
}
[/java]
