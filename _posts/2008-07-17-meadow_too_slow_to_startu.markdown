--- 
layout: post
title: "meadow3\xE3\x81\xAE\xE8\xB5\xB7\xE5\x8B\x95\xE3\x81\x8C\xE9\x87\x8D\xE3\x81\x99\xE3\x81\x8E\xE3\x82\x8B\xE3\x81\xAE\xE3\x81\xA7"
wordpress_id: 382
wordpress_url: http://zzz.jeeet.net/?p=85
date: 2008-07-17 01:57:16 +09:00
---
自分はVista, Cygwin, Meadow3という環境です．

Meadow3を起動すると，勝手に.emacsに記述していないものまでautoloadして，挙句の果てに勝手にanthy-agentがないです，というエラーを吐いたりする．

重いしエラー出るし，自分が必要なものだけ.emacsに記述してautoloadすればいいと思うので，少々強引な方法でこれを解決します．

MeadowをインストールしたフォルダをC:meadowだとすると

C:meadowpackagesにある，pkginfoというフォルダの名前をpkginfo_oldなどに変えてしまいます．

消すとあとで困るかもしれないので名前を変えて残しておきましょう．



これで起動が軽くなりました．

ちゃんと治す方法を知っていたら教えてください
