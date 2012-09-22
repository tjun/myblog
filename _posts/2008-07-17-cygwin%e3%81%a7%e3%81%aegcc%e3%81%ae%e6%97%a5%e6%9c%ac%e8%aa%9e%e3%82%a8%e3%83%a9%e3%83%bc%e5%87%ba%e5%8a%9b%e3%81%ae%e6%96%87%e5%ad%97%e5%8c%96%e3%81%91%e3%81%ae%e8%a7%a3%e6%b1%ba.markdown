---
layout: post
status: publish
published: true
title: Cygwinでのgccの日本語エラー出力の文字化けの解決
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 383
wordpress_url: http://zzz.jeeet.net/2008/07/cygwin%e3%81%a7%e3%81%aegcc%e3%81%ae%e6%97%a5%e6%9c%ac%e8%aa%9e%e3%82%a8%e3%83%a9%e3%83%bc%e5%87%ba%e5%8a%9b%e3%81%ae%e6%96%87%e5%ad%97%e5%8c%96%e3%81%91%e3%81%ae%e8%a7%a3%e6%b1%ba/
date: 2008-07-17 16:23:57.000000000 +09:00
categories:
- Windows
- c言語
tags:
- cygwin
- vista
- Windows
comments:
- id: 313
  author: Nicky
  author_email: nicky@hotmail.co.jp
  author_url: ''
  date: '2011-06-06 23:00:25 +0900'
  date_gmt: '2011-06-06 14:00:25 +0900'
  content: ! "ありがとうございます！！ありがとうございます！！！\r\n突然すみません　ずっと解決策を探して１時間半ばかり悩んでいたもので；；\r\nお陰様で解決しました！本当にありがとうございます！！"
---
自分の環境はwindows Vista + Cygwin + zsh　です．

まず，環境変数<b>LANG=ja_JP.SJIS</b>にすれば，lsなどの出力で日本語ファイル名が文字化けする問題は解決すると思います．

しかし，なぜかc言語で書いたプログラムをgccでコンパイルするときに出るエラーが文字化けしてしまいました．

この原因を解決するために
<a href="http://co-coa.sakura.ne.jp/index.php?YACI%2F%E5%9F%BA%E6%9C%AC%E7%9A%84%E3%81%AA%E4%BD%9C%E3%82%8A%E6%96%B9">YACI/基本的な作り方 - Co-Coa Wiki</a>
を参考にして，
環境変数<b>OUTPUT_CHARSET=sjis</b>
としてやると，無事に日本語で文字化けすることなく出力されました．


しかし，「警告：　制御が非void 関数の終りに到達しました」
という日本語のエラーメッセージはなんかかっこ悪い．

エラーメッセージは英語のほうが慣れているというのもあって，結局エラーメッセージを英語で出力することにしました．

それは、環境変数LC_MESSAGES=C
としてやるとokです．


環境変数を変える方法としては，コントロールパネルのシステムの詳細設定から変えるか，または.zshrc(bashの人は.bashrc)に
<pre>export LANG=ja_JP.SJIS
export OUTPUT_CHARSET=sjis
export LC_MESSAGES=C</pre>
などと記述してやればokです．
