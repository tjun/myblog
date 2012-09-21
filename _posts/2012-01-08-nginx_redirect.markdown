--- 
layout: post
title: "nginx\xE3\x81\xA7\xE3\x82\xB9\xE3\x83\x9E\xE3\x83\x9B\xE3\x81\x8B\xE3\x82\x89\xE3\x81\xAE\xE3\x82\xA2\xE3\x82\xAF\xE3\x82\xBB\xE3\x82\xB9\xE3\x82\x92\xE3\x83\xAA\xE3\x83\x80\xE3\x82\xA4\xE3\x83\xAC\xE3\x82\xAF\xE3\x83\x88"
wordpress_id: 1081
wordpress_url: http://tjun.jp/blog/?p=1081
date: 2012-01-08 12:22:29 +09:00
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
    if ($http_user_agent ~* “2.0\ 2MMP|240×320|400X240|BlackBerry|Cellphone|Googlebot-Mobile|Opera\ Mini|iPhone|iPod|Android|BlackBerry9530|Nokia5800″) {
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
	<li><a href="http://debiancdn.wordpress.com/2012/01/08/nginx-rewrite%e3%81%ab%e3%81%af%e3%81%a1%e3%82%83%e3%82%93%e3%81%a8%e3%81%a8%e3%82%92%e3%81%a4%e3%81%91%e3%82%88%e3%81%86/">Nginx: rewriteにはちゃんと^と$をつけよう « debiancdn</a></li>
</ul>


<h3>参考にしたサイト</h3>
２つめのサイトでは、rewriteのflagの使い方なども載っていて、参考になります。

<ul>
	<li><a href="http://iandouglas.com/2010/01/20/howto-redirect-iphoneipod-users-on-nginx/">HOWTO: redirect iPhone/iPod users on nginx – iandouglas.com</a></li>
	<li><a href="http://sakura.off-soft.net/centos/apache-nginx-4-setting-redirect.html">apache のかわりにnginxを使ってみる(4) nginx でリダイレクトするには | レンタルサーバー・自宅サーバー設定・構築のヒント</a></li>
</ul>

