---
layout: post
status: publish
published: true
title: ubuntuでLDAPクライアントの設定
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 78
wordpress_url: http://tjun.jp/blog/2009/10/ubuntu%e3%81%a7ldap%e3%82%af%e3%83%a9%e3%82%a4%e3%82%a2%e3%83%b3%e3%83%88%e3%81%ae%e8%a8%ad%e5%ae%9a/
date: 2009-10-03 20:09:37.000000000 +09:00
categories:
- server
- ubuntu
tags:
- ubuntu
- server
comments: []
---
ldapクライアントの設定においては，まず知っておかなければならない情報があって
<ul>
	<li>ldapサーバのIP/uri: ldap://192.168.18.1など</li>
</ul>
<ul>
	<li>suffix: dc=example,dc=comなど</li>
</ul>
これは，URIのドットで区切られる全ての部分にdc=をつけてけばよいみたい
<ul>
	<li>rootdn: cn=admin, dc=example,dc=comなど</li>
</ul>
suffixにcnが加わります
<ul>
	<li>rootpw: これはldapサーバの/etc/ldap.secret　に書いてあるやつでいいのかな．とにかく設定されたパスワード</li>
</ul>
<ul>
	<li>ldapのバージョン: 今のはだいたい３だとおもう</li>
</ul>
これらを知った上で，クライアントで作業をします

まず，関連するパッケージをインストール
<pre>sudo apt-get install libpam-ldap libnss-ldap ldap-utils nss-updatedb libnss-db
</pre>
インストール中に設定画面が出るので，さっきの情報を入力していきます

これでうまくいかないので，

<a href="http://d.hatena.ne.jp/norizo3/20090924/1253805974">Ubuntu 9.04 LDAPクライアント設定 - Cafe L@ Bebop</a>

を参考にして/etc/pam.d内のファイルで設定をしていきます．

最後に
<pre>sudo /etc/init.d/libnss-ldap restart
</pre>
で反映されます．

その他の参考
<a href="https://help.ubuntu.com/community/LDAPClientAuthentication">LDAPClientAuthentication - Community Ubuntu Documentation</a>
