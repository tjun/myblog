---
layout: post
status: publish
published: true
title: ubuntuのバージョンを確認する
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 673
wordpress_url: http://tjun.jp/blog/?p=673
date: 2010-11-17 12:46:17.000000000 +09:00
categories:
- linux
- ubuntu
tags:
- ubuntu
- linux
comments: []
---
メモ。
使ってるubuntuサーバのバージョンが分からなかったので知りたくなった。

<pre>
$ cat /etc/lsb-release | grep DESCRIPTION
DISTRIB_DESCRIPTION="Ubuntu 8.04.4 LTS"
</pre>

