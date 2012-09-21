--- 
layout: post
title: "ubuntu10.04\xE3\x81\xABnginx\xE3\x81\xA8php-fpm\xE3\x82\x92\xE5\x85\xA5\xE3\x82\x8C\xE3\x81\xA6wordpress\xE5\x8B\x95\xE3\x81\x8B\xE3\x81\x99"
wordpress_id: 1118
wordpress_url: http://tjun.jp/blog/?p=1118
date: 2012-04-08 21:33:04 +09:00
---
前の構成ではspawn-cgiを使っていたけど、php-fpmを使ったほうがいい、らしいのでそうします。
nginxやphp5が予め入っている場合は、一度uninstall してからの方がよいかもです。

<h3>レポジトリの追加</h3>
<pre>
$ sudo aptitude install python-software-properties
$ sudo add-apt-repository ppa:nginx/stable
$ sudo add-apt-repository ppa:brianmercer/php5
$ sudo aptitude update
</pre>


<h3>インストール</h3>
<pre>
$ sudo aptitude install nginx
$ sudo aptitude install php5 php5-cgi php5-cli php5-mysql php5-gd php-apc php5-fpm
</pre>


<h3>php5-fpmの設定</h3> 
変更するファイルは２つあります。

/etc/php5/fpm/php-fpm.conf
<pre>
;変更箇所
;ログの場所を/var/log/php以下にする
error_log = /var/log/php/php5-fpm.log

;linuxなのでepoll指定
events.mechanism = epoll
</pre>

/etc/php5/fpm/pool.d/www.conf
も編集
<pre>
;同じサーバで動かすので、unix socketを使う
;listen = 127.0.0.1:9000
listen = /var/run/php-fpm/www.sock

;unix socket使えば必要ない気もするけど、ローカル以外から接続できないように。
listen.allowed_clients = 127.0.0.1

;slowログを出してみる
slowlog = /var/log/php/$pool.log.slow
request_slowlog_timeout = 2
request_terminate_timeout = 5
</pre>
他のパラメータは、あとで検討する。

php5-fpmの起動
<pre>
$ sudo service php5-fpm start
</pre>



<h3>nginxの設定</h3>

nginxは普通に設定すればいいですが、先程のphp5-fpmにunix socketで接続するため、
<pre>fastcgi_pass   127.0.0.1:9000;</pre>
のようになっているところを、
<pre>fastcgi_pass    unix:/var/run/php-fpm/www.sock;</pre>
に変更します。

他の設定は以下のサイトなどを参考にやります。
<ul>
<li><a href="http://kray.jp/blog/wordpress-tuning/">WordPressを100倍速くする！ MySQLの調整やnginx proxy cache | KRAY Inc</a></li>
<li><a href="http://sakuratan.biz/archives/4582">さくらVPSとnginxリバースプロクシで最速WordPressブログを作る方法（ベンチマーク付き） | さくらたんどっとびーず</a></li>
</ul>



以上です。
nginxの設定が複雑でよく分からなくなっているでの、次回は、
<ul>
<li><a href="http://cloudrop.jp/wordpress/more_tuning_on_nginx#toc-wordpress-conf">Nginxを使ったもう一歩進んだWordPressチューニング | cloudrop</a></li>
</ul>
にあるような設定を入れたいです。



<h3>参考にしたサイト：</h3>
<ul>
<li><a href="http://www.justincarmony.com/blog/2011/10/24/setting-up-nginx-php-fpm-on-ubuntu-10-04/">Setting Up Nginx &amp; PHP-FPM on Ubuntu 10.04 | Justin Carmony</a></li>
<li><a href="http://blog.sanojimaru.com/post/18535554226/ubuntu10-04lts-nginx-php-fpm-wordpress-cakephp">Ubuntu10.04LTS+nginx+php-fpmでwordpressやCakePHPを動かす : blog.sanojimaru.com</a></li>
</ul>
