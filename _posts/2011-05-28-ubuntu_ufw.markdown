---
layout: post
status: publish
published: true
title: Ubuntuのufwでファイアウォール設定
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 814
wordpress_url: http://tjun.jp/blog/?p=814
date: 2011-05-28 12:08:26.000000000 +09:00
categories:
- server
- ubuntu
tags:
- ubuntu
- security
comments: []
---
vpsなど自分で管理するサーバーは、ちゃんと自分で守らなくては、ということでファイアウォールを設定していたのを思い出したのでメモ。
最近のubuntuはufwで設定するらしい。iptablesのフロントエンドらしい。

まずはufwを有効に。
<pre>
$ sudo ufw enable
</pre>

次に、基本的に拒否して、使うポートだけ開けていきます。
<pre>$ sudo ufw default DENY
</pre>

今回開けるのは、とりあえずhttpとssh。
sshは攻撃を受けやすいので、portを変えましょう。
<ul>
	<li><a href="http://tjun.jp/blog/2011/05/ubuntu_change_sshport/">Ubuntuでsshのポートを変更する | tjun memo</a></li>
</ul>

それが無理ならLIMITにしましょう。
LIMITは30秒間に6回アクセスしてきた IP の接続を一定時間拒否するという設定です。ブルートフォース対策です。

<pre>
$ sudo ufw allow 80/tcp
$ sudo ufw limit ssh
</pre>

現状を確認
<pre>
$ sudo ufw status
Status: active

To                         Action      From
--                         ------      ----
22/tcp                     LIMIT       Anywhere
80/tcp                     ALLOW       Anywhere
</pre>

以上です。

参考：

* <a href="http://gihyo.jp/admin/serial/01/ubuntu-recipe/0077">Ubuntu Weekly Recipe：第77回　Ubuntuのソフトウェアファイアウォール：ufwの利用（2）｜gihyo.jp &hellip; 技術評論社</a>

