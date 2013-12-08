---
layout: post
status: publish
published: true
title: MacでChromeがupdate後起動できなくなった時の対処
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 803
wordpress_url: http://tjun.jp/blog/?p=803
date: 2011-05-04 02:25:11.000000000 +09:00
categories:
- mac
tags:
- mac
- google
- web
comments: []
---
<a href="http://www.flickr.com/photos/34889156@N00/2820302020/" title="Google Chrome Logo" target="_blank"><img src="http://farm4.static.flickr.com/3075/2820302020_eb39fa50e0_m.jpg" alt="Google Chrome Logo" border="0" /></a><br /><small> <a href="http://www.photodropper.com/photos/" target="_blank">photo</a> credit: <a href="http://www.flickr.com/photos/34889156@N00/2820302020/" title="Randy Zhang" target="_blank">Randy Zhang</a></small>

MacでGoogle Chromeがどうにも起動できなくなっちゃったときの対処法です。

Chromeアップデートの時にChromeを終了して、それを忘れていてそのままキャッシュを消すソフトなどを使った後にMacを終了して、次回Chromeを起動しようとしたところ、起動できずに落ちてしまうようになりました。


<h3>まずはとりあえず再インストールを試す。</h3>
<a href="http://www.google.co.jp/chrome/intl/ja/landing_ch.html">Google Chrome - ブラウザのダウンロード</a>

<h3>それでもダメならユーザデータを消去する</h3>
Chromeの再インストールなどやってもだめな場合は、これまでのユーザデータを消してしまうと取りあえずインストール＆起動できなくなります。

<span style="color: #ff0000;"><strong>注：この方法ではブックマークや拡張機能などのデータはすべて消えます。
</strong></span>

Chromeのユーザデータは/Users/[ユーザ名]/Library/Application Support/Google/Chrome/ 以下にあるので、それを消去します。

<pre>rm -rf /Users/[ユーザ名]/Library/Application Support/Google/Chrome/</pre>

本当は、正しく不要なデータだけ消せばブックマークや拡張機能は保持したまま直すことができると思います。

自分は、よく分からない＆ブックマークや拡張機能は他と同期しているのですぐに戻せる　のでこの手段を使ったけど、そうでない場合はおすすめできません。
