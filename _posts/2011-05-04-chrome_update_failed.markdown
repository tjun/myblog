--- 
layout: post
title: "Mac\xE3\x81\xA7Chrome\xE3\x81\x8Cupdate\xE5\xBE\x8C\xE8\xB5\xB7\xE5\x8B\x95\xE3\x81\xA7\xE3\x81\x8D\xE3\x81\xAA\xE3\x81\x8F\xE3\x81\xAA\xE3\x81\xA3\xE3\x81\x9F\xE6\x99\x82\xE3\x81\xAE\xE5\xAF\xBE\xE5\x87\xA6"
wordpress_id: 803
wordpress_url: http://tjun.jp/blog/?p=803
date: 2011-05-04 02:25:11 +09:00
---
<a href="http://www.flickr.com/photos/34889156@N00/2820302020/" title="Google Chrome Logo" target="_blank"><img src="http://farm4.static.flickr.com/3075/2820302020_eb39fa50e0_m.jpg" alt="Google Chrome Logo" border="0" /></a><br /><small><a href="http://creativecommons.org/licenses/by-sa/2.0/" title="Attribution-ShareAlike License" target="_blank"><img src="http://tjun.jp/blog/wp-content/plugins/photo-dropper/images/cc.png" alt="Creative Commons License" border="0" width="16" height="16" align="absmiddle" /></a> <a href="http://www.photodropper.com/photos/" target="_blank">photo</a> credit: <a href="http://www.flickr.com/photos/34889156@N00/2820302020/" title="Randy Zhang" target="_blank">Randy Zhang</a></small>

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
