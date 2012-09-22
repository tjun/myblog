---
layout: post
status: publish
published: true
title: meadow3の起動が重すぎるので
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 382
wordpress_url: http://zzz.jeeet.net/?p=85
date: 2008-07-17 01:57:16.000000000 +09:00
categories:
- programming
- Windows
tags:
- cygwin
- meadow
- vista
- Windows
comments:
- id: 68
  author: koichiro
  author_email: koichiro@meadowy.org
  author_url: http://ko.meadowy.net/~koichiro/diary/
  date: '2008-11-23 13:15:37 +0900'
  date_gmt: '2008-11-23 04:15:37 +0900'
  content: ! 'MeadowのNetinstallerに付属するパッケージをすべてインストールするとそうなってしまうので、必要なパッケージだけ選択してインストールすると良いですよ。

    setup.exeを使ってインストール済みのパッケージをアンインストールすることもできるので試してみてください。'
- id: 69
  author: tjun
  author_email: t.junichiro@gmail.com
  author_url: http://jeeet.net/
  date: '2008-11-25 01:28:35 +0900'
  date_gmt: '2008-11-24 16:28:35 +0900'
  content: ! 'なるほど、たしかに何も考えずにfull installしたかもしれません。


    アンインストール、試してみます'
---
自分はVista, Cygwin, Meadow3という環境です．

Meadow3を起動すると，勝手に.emacsに記述していないものまでautoloadして，挙句の果てに勝手にanthy-agentがないです，というエラーを吐いたりする．

重いしエラー出るし，自分が必要なものだけ.emacsに記述してautoloadすればいいと思うので，少々強引な方法でこれを解決します．

MeadowをインストールしたフォルダをC:meadowだとすると

C:meadowpackagesにある，pkginfoというフォルダの名前をpkginfo_oldなどに変えてしまいます．

消すとあとで困るかもしれないので名前を変えて残しておきましょう．



これで起動が軽くなりました．

ちゃんと治す方法を知っていたら教えてください
