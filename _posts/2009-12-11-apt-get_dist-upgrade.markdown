--- 
layout: post
title: "apt-get \xE3\x81\xA7\xE4\xBF\x9D\xE7\x95\x99\xE3\x81\x95\xE3\x82\x8C\xE3\x82\x8B\xE3\x83\x91\xE3\x83\x83\xE3\x82\xB1\xE3\x83\xBC\xE3\x82\xB8\xE3\x81\xAE\xE3\x82\xA2\xE3\x83\x83\xE3\x83\x97\xE3\x82\xB0\xE3\x83\xAC\xE3\x83\xBC\xE3\x83\x89"
wordpress_id: 186
wordpress_url: http://tjun.jp/blog/?p=186
date: 2009-12-11 13:43:41 +09:00
---
ubuntuサーバを使っていて
<pre>$ sudo apt-get update
$ sudo apt-get upgrade
</pre>
をやると，
「以下のパッケージは保留されます」
と出ていくつかインストールできないことがあります．

これは，再起動が必要であったり依存関係で削除されるファイルや設定があったり，ということで保留されるようです。
でもサーバ再起動する前などにインストールしちゃいたい時は，
<pre>$ sudo apt-get -s dist-upgrade
</pre>
で確認できて
<pre>$ sudo apt-get dist-upgrade
</pre>
でインストールできます．
