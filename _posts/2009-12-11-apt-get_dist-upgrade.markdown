---
layout: post
status: publish
published: true
title: apt-get で保留されるパッケージのアップグレード
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 186
wordpress_url: http://tjun.jp/blog/?p=186
date: 2009-12-11 13:43:41.000000000 +09:00
categories:
- ubuntu
tags:
- ubuntu
- server
- linux
comments: []
---

ubuntuサーバを使っていて

    $ sudo apt-get update
    $ sudo apt-get upgrade

をやると，
「以下のパッケージは保留されます」
と出ていくつかインストールできないことがあります．

これは，再起動が必要であったり依存関係で削除されるファイルや設定があったり，ということで保留されるようです。
でもサーバ再起動する前などにインストールしちゃいたい時は，

    $ sudo apt-get -s dist-upgrade

で確認できて

    $ sudo apt-get dist-upgrade

でインストールできます．
