--- 
layout: post
title: "smart phone\xE5\x90\x91\xE3\x81\x91web\xE3\x82\xA2\xE3\x83\x97\xE3\x83\xAA\xE3\x81\xA7\xE5\x8A\xA0\xE9\x80\x9F\xE5\xBA\xA6\xE3\x82\xBB\xE3\x83\xB3\xE3\x82\xB5\xE3\x81\xAF\xE4\xBD\xBF\xE3\x81\x88\xE3\x81\xAA\xE3\x81\x84?"
wordpress_id: 254
wordpress_url: http://tjun.jp/blog/?p=254
date: 2010-06-13 02:05:52 +09:00
---
iPhoneやandroidでウェブアプリから加速度センサの情報を利用したいなと思っていろいろ調べてみた。

位置情報と方角は利用できる。(iPhone)
<ul>
	<li><a href="http://wiki.sohaya.com/index.php/%E5%90%84%E7%A8%AE%E3%83%87%E3%83%90%E3%82%A4%E3%82%B9%E3%81%AE%E8%AA%AD%E3%81%BF%E5%8F%96%E3%82%8A">各種デバイスの読み取り - iPhone 3G DevWiki</a></li>
</ul>

加速度は無理なのかとあきらめてたけど、こんな記事が。(iPhone)
<ul>
	<li><a href="http://d.hatena.ne.jp/uosoft/20100226/1267110536">HTMLとJavaScriptでiPhoneアプリを作る時に加速度センサを使う方法 - iPhoneSDK他いろいろ 開発メモ</a></li>
</ul>

これだと、ウェブアプリではなく、html & javascriptで書けるネイティブアプリ、という感じ。
うーむ、インストールとかAppleの審査とかなしで実現したかったのだが、それはできないのかな。
<a href="http://www.big5apps.com/">Big Five</a>っていうプラットフォームを利用すればできるようなのだが、AppleにRejectされてしまったらしい。


その他にもJavascriptベースでネイティブアプリを作る手段はいくつかあるみたい。よさそうなのは
<ul>
	<li><a href="http://www.phonegap.com/">Phone Gap</a></li>
	<li><a href="http://www.moongift.jp/2010/03/quickconnectfamily/">MOONGIFT: ? HTML/JavaScript/CSSで作るマルチプラットフォームアプリ「QuickConnectFamily」:オープンソースを毎日紹介</a></li>
</ul>

このあたりは、HTML+Javascriptで書いたアプリをiPhoneやAndroidアプリにしてくれる、というもの。


そして、
<ul>
	<li><a href="http://www.infoq.com/jp/news/2010/06/Android-2.2">InfoQ: Android 2.2の新機能、総まとめ</a></li>
</ul>

によると、
新しいAndroidでは
<blockquote>ブラウザからのデバイスへのアクセスAPI。 加速度計、カメラ、音声認識や翻訳など多くのデバイスAPIがブラウザから直接アクセスできるようになった。これによってウェブアプリケーションが今までできなかった方法でデバイスへアクセスできるようになる。例えば、写真を取り、ウェブサイトへ投稿するという処理がブラウザ内で完結してできる。</blockquote>
ブラウザからセンサデータがとれるっぽい。

いずれにせよ、うまくやればHTML+JavascriptでiPhoneやAndroidで加速度センサ利用アプリが作れそう。
まずはPhoneGapとかを利用して、将来的にインストールなしにブラウザ上で動く、っていうのを目指すのがよいのか。
