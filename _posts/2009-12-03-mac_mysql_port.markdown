---
layout: post
status: publish
published: true
title: MacにMySQL入れた
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 156
wordpress_url: http://tjun.jp/blog/?p=156
date: 2009-12-03 04:44:19.000000000 +09:00
categories:
- db
- mac
tags:
- mac
- db
- mysql
comments: []
---
ちょっと必要があったのでMySQLをMac Bookに入れました。

いろんな手段があると思うけど、port使って入れた。
自分で言うのもなんだが、適当なのであまり参考にしない方がいいかもです。

<pre>
$ sudo port install mysql5
</pre>

これだけだとmysqlのコマンドが使えなかったので

<pre>
sudo ln -s /opt/local/bin/mysql5 /opt/local/bin/mysql
</pre>

をやります。

どうやって起動するのかよくわからなかったが、なんかさっき入れたのはサーバじゃないかも、と思い、

<pre>
$ sudo port install mysql5-server
</pre>

をやったところ、少しメッセージが出ました。

<pre>
# A startup item has been generated that will aid in
# starting mysql5-server with launchd. It is disabled
# by default. Execute the following command to start it,
# and to cause it to launch at startup:

# sudo launchctl load -w /Library/LaunchDaemons/org.macports.mysql5.plist
</pre>

<div>起動時にMySQLサーバも起動したいならこれをやるといいらしいが、たまにテストでつかうだけなのでスルー。</div>
<pre>
* In order to setup the database, you might want to run
* sudo -u _mysql mysql_install_db5
* if this is a new install
</pre>

こんなメッセージも出たので実行
<pre>
$?sudo -u _mysql mysql_install_db5
</pre>

またいくつかメッセージが出る。
<pre>
You can start the MySQL daemon with:
cd /opt/local ; /opt/local/lib/mysql5/bin/mysqld_safe &amp;
</pre>

sudoがいるのでそのままコピペしてもだめです。あとcdはいらないような。
<pre>$ cd /opt/local ; sudo /opt/local/lib/mysql5/bin/mysqld_safe &amp;
</pre>

<div>これで起動できたっぽい。</div>
<div>mysqlのrootパスワード初期化するのもさっきのメッセージにあったのでやる</div>

<pre>
To do so, start the server, then issue the following commands:
/opt/local/lib/mysql5/bin/mysqladmin -u root password 'new-password'
/opt/local/lib/mysql5/bin/mysqladmin -u root -h *****.local password 'new-password'
</pre>


<div>これでok.</div>
<div>つないでみる</div>
<pre>
mysql -u root -p
</pre>

<div>さっき設定したパスワードを入れてやると接続できた。</div>
<div>ここまでやってから調べてみたが、最初から</div>

<a href="http://d.hatena.ne.jp/yuru-sawa/20090320/1237548667" title="Mac Leopard に MySQL をインストールする - yuru-sawaの日記">Mac Leopard に MySQL をインストールする - yuru-sawaの日記</a>
あたりを参考にするとよかったと思います。

