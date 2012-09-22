---
layout: post
status: publish
published: true
title: Googleカレンダーをデスクトップのカレンダー(Rainlendar)と同期したい
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 386
wordpress_url: http://zzz.jeeet.net/?p=96
date: 2008-09-23 13:28:29.000000000 +09:00
categories:
- Windows
tags:
- google
- desktop
comments: []
---
<strong>[追記]古い記事なので、今でも使えるかちょっとわかりません</strong>
<strong>[追記]windowsXP以外でできるかわかりません</strong>

デスクトップにカレンダーを表示するソフトはたくさんあるが，「outlookは使いたくない」「google desktopは使いたくない」ということで，<a href="http://www.rainlendar.net/cms/index.php">Rainlendar</a>を使いました．
たぶんrainlendar有料版なら簡単に設定できると思うので，そっちを使ってもらってもいいのですが，自分は無料版でやっています．

併用するソフトは，<a href="http://gcaldaemon.sourceforge.net/usage2.html">GCALDaemon</a>．

まず，<a href="http://www.rainlendar.net/cms/index.php">rainlendar</a>をインストール．<strong>Download</strong> &rarr; <strong>rainlendar</strong>からダウンロードしてインストール．

次に，<a href="http://www.rainlendar.net/cms/index.php">rainlendar</a>の日本語化をする．<strong>Download</strong> &rarr;　<strong>languages</strong>からダウンロードしたら勝手にインストールできたと思う．

そして，rainlendarの再起動．デスクトップのrainlendarを右クリックして，<strong>refresh</strong>でよかったと思う．


次に，<a href="http://gcaldaemon.sourceforge.net/usage10.html">GCALDaemon</a>のインストール．読んでもらえばわかるが，<a href="http://sourceforge.net/project/showfiles.php?group_id=184382">ここ</a>のwindows installerから最新のものを選べばいい．

で，インストールしたら，まずインストール先のフォルダ「<strong>GCALDaemon</strong>」&rarr;「<strong>bin</strong>」を開いて，「<strong>password-encorder.bat</strong>」を起動します．

ここに自分のgmailのパスワードを入力すると，パスワードをエンコードしたもの（長い文字列）が表示されるので，それをコピーします．

次に，「<strong>GCALDaemon</strong>」&rarr;「<strong>conf</strong>」を開いて，
<a href="http://gcaldaemon.sourceforge.net/usage2.html#top">http://gcaldaemon.sourceforge.net/usage2.html#top</a>にあるように設定していきます．

これで，設定が終わったら保存して，「<strong>GCALDaemon</strong>」&rarr;「<strong>bin</strong>」から「<strong>standalone-start.bat</strong>」をダブルクリック．

ここまでで，<strong>GCALDaemonフォルダ</strong>下に「<strong>google.ics</strong>」というファイルが作成されたはず．

そしたら，デスクトップ上の<strong>rainlendar</strong>を右クリック&rarr;<strong>オプション</strong>から，「<strong>カレンダー</strong>」の「<strong>iCalendarフォーマット</strong>」にさっきの「google.ics」のパスを通してやればOK.
