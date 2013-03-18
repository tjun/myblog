---
layout: post
status: publish
published: true
title: ! '[mac]opendirectorydの暴走を解決'
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1078
wordpress_url: http://tjun.jp/blog/?p=1078
date: 2012-01-07 01:02:43.000000000 +09:00
categories:
- mac
tags:
- mac
comments: []
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

