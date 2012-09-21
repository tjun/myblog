--- 
layout: post
title: "Cygwin in Windows Vista\xE3\x81\xA7\xE3\x81\xAE\xE3\x83\x88\xE3\x83\xA9\xE3\x83\x96\xE3\x83\xAB\xE8\xA7\xA3\xE6\xB1\xBA"
wordpress_id: 380
wordpress_url: http://zzz.jeeet.net/?p=83
date: 2008-07-16 02:58:49 +09:00
---
zshを使っているせいか、シェルの起動時やコマンド入力時にparameter.dllがどうのこうのっていうエラーが頻繁に出てしまうことがあった.

<a href="http://blogs.yahoo.co.jp/eguchium/36260060.html">http://blogs.yahoo.co.jp/eguchium/36260060.html</a>
で紹介されている方法を試してみたら，解決した．


Ctrl+Alt+Delでタスクマネージャーを開いてプロセスを見てみると，sh.exeやbash.exeやzsh.exeが多数動いていることがある．Cygwinを終了しても残っている場合はプロセスマネージャーからそれらのプロセスをすべて終了させて，コマンドプロンプトから,
<pre>cd ..</pre>
を数回入力して一番上まで行ったあと，
<pre>C:\> cd cygwin/bin
C:\cygwin\bin>ash.exe
</pre>
を実行し，
<pre>
$rebaseall
</pre>
を実行．しばらくまってまた$が出てきたら終了．
<pre>exit</pre>を2回入力して終了．

これを行ってからはエラーが起こらなくなりました．
