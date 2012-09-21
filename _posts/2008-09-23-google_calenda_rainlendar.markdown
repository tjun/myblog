--- 
layout: post
title: "Google\xE3\x82\xAB\xE3\x83\xAC\xE3\x83\xB3\xE3\x83\x80\xE3\x83\xBC\xE3\x82\x92\xE3\x83\x87\xE3\x82\xB9\xE3\x82\xAF\xE3\x83\x88\xE3\x83\x83\xE3\x83\x97\xE3\x81\xAE\xE3\x82\xAB\xE3\x83\xAC\xE3\x83\xB3\xE3\x83\x80\xE3\x83\xBC(Rainlendar)\xE3\x81\xA8\xE5\x90\x8C\xE6\x9C\x9F\xE3\x81\x97\xE3\x81\x9F\xE3\x81\x84"
wordpress_id: 386
wordpress_url: http://zzz.jeeet.net/?p=96
date: 2008-09-23 13:28:29 +09:00
---
<strong>[追記]古い記事なので、今でも使えるかちょっとわかりません</strong>
<strong>[追記]windowsXP以外でできるかわかりません</strong>

デスクトップにカレンダーを表示するソフトはたくさんあるが，「outlookは使いたくない」「google desktopは使いたくない」ということで，<a href="http://www.rainlendar.net/cms/index.php">Rainlendar</a>を使いました．
たぶんrainlendar有料版なら簡単に設定できると思うので，そっちを使ってもらってもいいのですが，自分は無料版でやっています．

併用するソフトは，<a href="http://gcaldaemon.sourceforge.net/usage2.html">GCALDaemon</a>．

まず，<a href="http://www.rainlendar.net/cms/index.php">rainlendar</a>をインストール．<strong>Download</strong> → <strong>rainlendar</strong>からダウンロードしてインストール．

次に，<a href="http://www.rainlendar.net/cms/index.php">rainlendar</a>の日本語化をする．<strong>Download</strong> →　<strong>languages</strong>からダウンロードしたら勝手にインストールできたと思う．

そして，rainlendarの再起動．デスクトップのrainlendarを右クリックして，<strong>refresh</strong>でよかったと思う．


次に，<a href="http://gcaldaemon.sourceforge.net/usage10.html">GCALDaemon</a>のインストール．読んでもらえばわかるが，<a href="http://sourceforge.net/project/showfiles.php?group_id=184382">ここ</a>のwindows installerから最新のものを選べばいい．

で，インストールしたら，まずインストール先のフォルダ「<strong>GCALDaemon</strong>」→「<strong>bin</strong>」を開いて，「<strong>password-encorder.bat</strong>」を起動します．

ここに自分のgmailのパスワードを入力すると，パスワードをエンコードしたもの（長い文字列）が表示されるので，それをコピーします．

次に，「<strong>GCALDaemon</strong>」→「<strong>conf</strong>」を開いて，
<a href="http://gcaldaemon.sourceforge.net/usage2.html#top">http://gcaldaemon.sourceforge.net/usage2.html#top</a>にあるように設定していきます．

これで，設定が終わったら保存して，「<strong>GCALDaemon</strong>」→「<strong>bin</strong>」から「<strong>standalone-start.bat</strong>」をダブルクリック．

ここまでで，<strong>GCALDaemonフォルダ</strong>下に「<strong>google.ics</strong>」というファイルが作成されたはず．

そしたら，デスクトップ上の<strong>rainlendar</strong>を右クリック→<strong>オプション</strong>から，「<strong>カレンダー</strong>」の「<strong>iCalendarフォーマット</strong>」にさっきの「google.ics」のパスを通してやればOK.
