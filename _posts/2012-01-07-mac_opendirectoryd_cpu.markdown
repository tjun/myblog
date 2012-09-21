--- 
layout: post
title: "[mac]opendirectoryd\xE3\x81\xAE\xE6\x9A\xB4\xE8\xB5\xB0\xE3\x82\x92\xE8\xA7\xA3\xE6\xB1\xBA"
wordpress_id: 1078
wordpress_url: http://tjun.jp/blog/?p=1078
date: 2012-01-07 01:02:43 +09:00
---
環境はMacBookAir2010?, Mac OSX 10.7.2 Lionでした。
CPU使用率が突然高くなることがあって調べてみると、opendirectorydというプロセスが50%くらい消費してた。

で、自分の場合の原因は「宛先が存在しないシンボリックリンクがDropbox内に存在すること」でした。

シンボリックリンクの探し方は以下のコマンドを実行。
<pre>
$ find ~/Dropbox -type l
</pre>

これで、宛先がないシンボリックリンクが見つかって、それを消してからはopendirectorydの暴走はなくなりました。

参考：
<ul>
	<li><a href="http://superuser.com/questions/350879/opendirectoryd-consumes-40-of-cpu">osx - opendirectoryd consumes 40% of CPU - Super User</a></li>
</ul>


原因はこれ以外にもいろいろありえるみたいで、調べるの結構苦労しました。
<ul>
	<li><a href="https://discussions.apple.com/thread/3198682?start=0&tstart=0">launchd and opendirectoryd crazy CPU...: Apple Support Communities</a></li>
</ul>

