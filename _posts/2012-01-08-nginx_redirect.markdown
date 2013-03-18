---
layout: post
status: publish
published: true
title: nginxでスマホからのアクセスをリダイレクト
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1081
wordpress_url: http://tjun.jp/blog/?p=1081
date: 2012-01-08 12:22:29.000000000 +09:00
categories:
- server
- linux
tags:
- iphone
- android
- nginx
comments: []
---
nginxでiPhoneやAndroidからのアクセスをリダイレクトする方法のメモ。

Apacheなら.htaccessなどを使ってリダイレクトしますが、nginxだとちょっと違います。
/etc/nginx/sites-available/ にある設定から行います。


<pre>$vi /etc/nginx/sites-available/example.com</pre>

以下のように、rewriteを使ってリダイレクトします。

<pre>
server {
    listen 80;      
    server_name example.com;
    access_log  /var/log/nginx/example.com.access.log;
    error_log  /var/log/nginx/example.com.error.log;

    （中略）
    # スマホからのトップページへのアクセスを、/mobile にリダイレクト
    if ($http_user_agent ~* &ldquo;2.0\ 2MMP|240&times;320|400X240|BlackBerry|Cellphone|Googlebot-Mobile|Opera\ Mini|iPhone|iPod|Android|BlackBerry9530|Nokia5800&Prime;) {
           rewrite ^/$ /mobile last;
    }
}
</pre>


スマホ判定の部分は、どこかから持ってきたやつを適当にいじっただけなので、よく分からない端末名も入ってます。

if 文は、ifのあとにスペースがないとダメみたいなので注意。
<pre>
if (      #OK
if(       #NG
</pre>

あと、以下も注意。
<ul>
	<li><a href="http://debiancdn.wordpress.com/2012/01/08/nginx-rewrite%e3%81%ab%e3%81%af%e3%81%a1%e3%82%83%e3%82%93%e3%81%a8%e3%81%a8%e3%82%92%e3%81%a4%e3%81%91%e3%82%88%e3%81%86/">Nginx: rewriteにはちゃんと^と$をつけよう &laquo; debiancdn</a></li>
</ul>


<h3>参考にしたサイト</h3>
２つめのサイトでは、rewriteのflagの使い方なども載っていて、参考になります。

<ul>
	<li><a href="http://iandouglas.com/2010/01/20/howto-redirect-iphoneipod-users-on-nginx/">HOWTO: redirect iPhone/iPod users on nginx &ndash; iandouglas.com</a></li>
	<li><a href="http://sakura.off-soft.net/centos/apache-nginx-4-setting-redirect.html">apache のかわりにnginxを使ってみる(4) nginx でリダイレクトするには | レンタルサーバー・自宅サーバー設定・構築のヒント</a></li>
</ul>

