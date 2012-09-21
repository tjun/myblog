--- 
layout: post
title: "Kyoto Tycoon\xE3\x82\x92Java\xE3\x81\x8B\xE3\x82\x89\xE5\x88\xA9\xE7\x94\xA8\xE3\x81\x99\xE3\x82\x8B"
wordpress_id: 1065
wordpress_url: http://tjun.jp/blog/?p=1065
date: 2011-12-23 21:51:42 +09:00
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
String hostname = &quot;localhost&quot;;
String port = &quot;22222&quot;;
int expiration_time = 0;

XMemcachedClientBuilder builder = new XMemcachedClientBuilder(
        AddrUtil.getAddresses(hostname + &quot;:&quot; + port));
builder.setTranscoder(new TokyoTyrantTranscoder());
MemcachedClient client = builder.build();

ArrayList&lt;String&gt; keylist = new ArrayList&lt;String&gt;();

try{
    // set data
    System.out.println(&quot;set data&quot;);
　　　    for(Integer i = 0; i != 5; i++){
　　　　    String value = &quot;value&quot; + i;
        client.set(i.toString() , expiration_time, value);
        keylist.add(i.toString());
    }    

    // get data

    // bulk get
    System.out.println(&quot;bulk get&quot;);
    Map&lt;String, Object&gt; valuemap = client.get(keylist);
    for(Integer i =0; i != 5; i++){
        System.out.println(valuemap.get(keylist.get(i)));            
    }

    // single get
    System.out.println(&quot;single get&quot;);
    for(Integer i=0; i != 5; i++){
        String value = client.get(i.toString());
        System.out.println(value);
    }

　　　　// delete data
        System.out.println(&quot;delete data from db&quot;);

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
