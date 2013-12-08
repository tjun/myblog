---
layout: post
status: publish
published: true
title: さくらVPSへ移行
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 783
wordpress_url: http://tjun.jp/blog/?p=783
date: 2011-03-17 16:11:19.000000000 +09:00
categories:
- server
- wordpress
tags:
- server
- linux
- wordpress
comments: []
---
<a href="http://www.flickr.com/photos/12336536@N03/5526129241/" title="Sakura" target="_blank"><img src="http://farm6.static.flickr.com/5299/5526129241_37cf9c65a8_m.jpg" alt="Sakura" border="0" /></a><br /><small> <a href="http://www.photodropper.com/photos/" target="_blank">photo</a> credit: <a href="http://www.flickr.com/photos/12336536@N03/5526129241/" title="Windslash" target="_blank">Windslash</a></small>

そういえば、結構前になりますがこのブログとかをレンタルサーバからさくらのVPSに移行しました。
<ul>
	<li><a href="http://vps.sakura.ad.jp/">さくらのVPS</a></li>
</ul>

VPSはレンタルサーバと違って触れる部分が多いので、いろいろやりたい人にはおすすめです。
cron仕掛けたり、ほかのところで紹介されているwebサイト高速化を試してみたり。
値段もそんなに高くないと思います。

wordpressなどをさくらVPSに移行したときにやったことを書こうと思ったけど、あまり覚えていません。

このブログはwordpressですが、wordpressを動かす前にphp入れてapache入れてmysql入れて、っていうのをやらなきゃいけません。
wordpressの移行はデータベースの移行と設定の書き換えでちょっとはまりかけました。
ドメインの移行もはまりかけました。

でも移行してよかったと思います。
OSもある程度選べて、結構自由にできます。

以下は参考になりそうな記事。
<ul>
	<li><a href="http://1-byte.jp/2011/01/28/cheap_virtual_servers/">月額1,980円以下の仮想専用サーバ、国内外10サービスまとめ</a></li>

	<li><a href="http://internet.watch.impress.co.jp/docs/special/20100907_390781.html">月額980円で高速快適！　「さくらのVPS」を試用してみた -INTERNET Watch</a></li>

	<li><a href="http://phpspot.org/blog/archives/2011/02/webvps.html">Webサービス用にさくらのVPSサーバーを借りた後で役に立つ記事色々:phpspot開発日誌</a></li>

	<li><a href="http://d.hatena.ne.jp/koujirou6218/20101129">さくらVPSで一日6万PVを処理するためにしたこと - 新卒インフラエンジニア１年目</a></li>
</ul>


