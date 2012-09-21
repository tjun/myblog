--- 
layout: post
title: "iPhone\xE3\x81\xAB\xE3\x82\xBD\xE3\x83\x95\xE3\x83\x88\xE3\x83\x90\xE3\x83\xB3\xE3\x82\xAFWi-Fi\xE7\x94\xA8\xE3\x83\x97\xE3\x83\xAD\xE3\x83\x95\xE3\x82\xA1\xE3\x82\xA4\xE3\x83\xAB\xE3\x81\xAE\xE3\x82\xA4\xE3\x83\xB3\xE3\x82\xB9\xE3\x83\x88\xE3\x83\xBC\xE3\x83\xAB\xE3\x81\xA7\xE3\x81\xAF\xE3\x81\xBE\xE3\x81\xA3\xE3\x81\x9F\xE3\x83\xA1\xE3\x83\xA2"
wordpress_id: 598
wordpress_url: http://tjun.jp/blog/?p=598
date: 2010-09-09 05:15:34 +09:00
---
まずは公式をお読みください。
<ul>
	<li><a href="http://mb.softbank.jp/mb/support/fon/iphone/profile/">iPhoneへのプロファイルインストール方法 : FONルーター設定サポート | ソフトバンクモバイル</a></li>
</ul>


iPhoneでFonの回線を使えるらしいということで、
<ul>
	<li><a href="http://www.nw-style.com/2010/09/wi-fi.html">iPhoneでソフトバンクWi-Fiスポットに接続する方法｜Nomad Worker Style</a></li>
</ul>



をやろうと思って、サイト説明の通りにやっても、なぜかプロファイルのインストール画面にならずに
変なページになりました。

safariでここから
<a href="http://tjun.jp/blog/wp-content/uploads/2010/09/p_480_320_BC1CFFA2-149A-4865-AFF7-6136AE091F98.jpeg"><img src="http://tjun.jp/blog/wp-content/uploads/2010/09/p_480_320_BC1CFFA2-149A-4865-AFF7-6136AE091F98-200x300.jpg" alt="" title="インストールの前" width="200" height="300" class="aligncenter size-medium wp-image-602" /></a>

正しくいくとこんな感じなのに
<a href="http://tjun.jp/blog/wp-content/uploads/2010/09/p_480_320_B0C86A82-CC1A-4300-97D7-0DCE25D56C18.jpeg"><img src="http://tjun.jp/blog/wp-content/uploads/2010/09/p_480_320_B0C86A82-CC1A-4300-97D7-0DCE25D56C18-200x300.jpg" alt="" title="install画面" width="200" height="300" class="aligncenter size-medium wp-image-603" /></a>


自分はこの画面に行っちゃって、プロファイルがインストールできない。
<a href="http://tjun.jp/blog/wp-content/uploads/2010/09/p_480_320_7E6D8A9F-BE19-4751-9993-038587D583E7.jpeg"><img src="http://tjun.jp/blog/wp-content/uploads/2010/09/p_480_320_7E6D8A9F-BE19-4751-9993-038587D583E7-200x300.jpg" alt="" title="失敗画面" width="200" height="300" class="aligncenter size-medium wp-image-604" /></a>


いろいろ試してもだめなので、調べてみると
<a href="http://kaze-tado.way-nifty.com/moo/2010/08/post.html">プロファイルデータが上手くインストール出来ない場合: 暇人大学生MOOのブログ</a>
に対策が載ってました。

まず、前提として
・無線Lanではなく、3G回線を使ってアクセスする
・既存のi.softbank.jpのメールアカウントを削除しておく
が必要です。

で、プロファイルのインストール画面にいけない原因は、


<blockquote>1.(iPhone3G/3GSの場合)iOS4を導入してある。またはiPhone4である。

2.ダウンロード系のファイルアプリケーションを過去にインストールしたことがある。
(例えばYoutubeのファイルをiPhone上でダウンロード出来るアプリなど)

上記2点が当てはまる場合、そのアプリを削除し、iPhoneの再起動を行えば解決します。
</blockquote>

ということです。
自分の場合、DownloadsというアプリとiDownloadというアプリを削除して再起動してやり直したら、うまくいきました。

詳しいことは、
<a href="http://kaze-tado.way-nifty.com/moo/2010/08/post.html">プロファイルデータが上手くインストール出来ない場合: 暇人大学生MOOのブログ</a>を見てみてください。
