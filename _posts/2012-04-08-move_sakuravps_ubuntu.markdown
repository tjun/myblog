---
layout: post
status: publish
published: true
title: さくらVPSを512Mから1Gへ移行したメモ(ubuntu)
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1119
wordpress_url: http://tjun.jp/blog/?p=1119
date: 2012-04-08 21:36:22.000000000 +09:00
categories:
- server
- linux
- ubuntu
tags:
- ubuntu
- さくらvps
comments: []
---
このブログはさくらVPSで動かしてます。
同じ料金で、メモリ512Mのマシンからメモリ1Gのマシンに乗り換えられるということで、乗り換えました。
ディスク容量も20Gから100Gと増えてお得。

そのときのメモです。

<h3>OSのインストールまで</h3>
まず、契約します。

最初はcentosが入ってるけど、今までubuntuで使ってたから、新しいサーバもubuntuにします。
VPSコントロールパネルから、OS再インストール -> カスタムOSのインストール　というところでサーバを選択します。

インストールを選ぶとVNSコンソールが開いて、そこからインストール画面にいきます。
（pluginを有効にしないとVNSコンソールが開かず、結構はまりました。）


インストーラは基本的には、適当に選んでいけばいいと思いますが、パーティション決めるところでは、
* Guided use entire disk
みたいなところを選ばないと、いつの間にかマシンのディスクが5Gしかないみたいなことになってハマるから注意

インストールの最後の方で、ログインするユーザとパスワードを決めます。
インストール終わったらログインしていろいろ設定します。


<h3>ディスクサイズの確認</h3>
一度いろいろ設定したあとにディスクサイズが10Gくらいしか割り当てられてないっていうことがあったので、ちゃんと確認します。
<pre>
$ df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/vda1              96G  820M   90G   1% /
none                  498M  176K  497M   1% /dev
(以下略)
</pre>
今回はよさそう。

<h3>とりあえず</h3>
とりあえず入れとくか、というものを入れる。
<pre>sudo aptitude install vim screen zsh curl git-core build-essential</pre>

<h3>ssh関連の設定</h3>
rootログインを禁止して、パスワードでのログインも止めて、ポートも変えておきます。

ローカルから公開鍵をscpでサーバへ。
<pre>
(手元のpcで実行)
macbookair $ scp ~/.ssh/id_dsa.pub [username]@[ip]:
</pre>

vpsにログインして
<pre>
$ mkdir .ssh
$ cat id_dsa.pub >> .ssh/authorized_keys
</pre>

これで、ログイン時にパスワードが聞かれないことを確認。

次にsshサーバの設定。
<pre>
$ sudo vim /etc/ssh/sshd_config
</pre>

<pre>
変えた箇所の例
Port 23456 などに変える 
PermitRootLogin no
PasswordAuthentication no
UsePAM no
</pre>

sshdの再起動
<pre>
$ sudo service ssh restart
</pre>


<h3>ファイアウォールの設定</h3>
ubuntuはufwっていうのを使って設定します。

今回は、さっき設定したsshと、あとでウェブサーバを立てるので80と443を開けて、他を閉じます。
設定ミスるとログインできなくなるので気をつけて。

今の状態を確認。
<pre>
$ sudo ufw status
Status: inactive
</pre>

<pre>
sudo ufw default deny
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow <sshのport>
</pre>

ufwを有効にする。
<pre>
sudo ufw enable
</pre>



他には、
<ul>
<li>shellをzshにした</li>
<li>nginxとphp-fpmを入れてwordpressを動かした - <a href="http://tjun.jp/blog/2012/04/ubuntu-nginx-php-fpm-wordpress/">ubuntu10.04にnginxとphp-fpmを入れてwordpress動かす | tjun memo</a></li>
<li>余ったディスクをSparkleShareで使う - <a href="http://tjun.jp/blog/2012/04/sparkleshare/">さくらVPSにオレオレDropboxを作る | tjun memo</a></li>
</ul>

をやりました。

そのあとDNSの切り替えをミスってて1日つながらなくなってた。


<h3>関連するサイト：</h3>
<ul>
<li><a href="http://d.hatena.ne.jp/ymotongpoo/20120402/1333364114">さくらのVPSのプラン乗り換えをした - YAMAGUCHI::weblog</a></li>
</ul>
