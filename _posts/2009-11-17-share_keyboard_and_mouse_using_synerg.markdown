---
layout: post
status: publish
published: true
title: 複数のmacでキーボードとマウスを共有する
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 139
wordpress_url: http://tjun.jp/blog/?p=139
date: 2009-11-17 22:22:35.000000000 +09:00
categories:
- mac
tags:
- mac
comments: []
---
デスクトップのMacにはワイアレスのキーボードとマウスがつながっていて，となりにMac Book Proがあって，ワイアレスキーボードで両方を操作できたら便利だなと思うわけです．

<img class="aligncenter size-medium wp-image-140" title="desk" src="http://tjun.jp/blog/wp-content/uploads/2009/11/1-300x225.jpg" alt="desk" width="300" height="225" />

そこで，synergyというやつを使ってみました．

参考にしたサイト

<a href="http://www.bison.jp/nucleus/index.php?itemid=319">Synergy ふたたび！ - SynergyKM - --- --- 脳みその中身-</a>

これを２台のMacに入れて，片方（今回はデスクトップ）をマスターにしてやると，両方のMacでマウスとキーボードを共有できるようになりました．

設定すべきは
<h3>ホスト側</h3>
<ul>
	<li>設定のgeneralで "share my keyboard and mouse"にチェック</li>
	<li>上のEnable bonjourにもチェック</li>
	<li>"Server configuration"で２つのscreenを追加して，コンピュータ名を正しく入れる．ウィンドウの左右を正しく配置する</li>
</ul>
<img class="aligncenter size-medium wp-image-141" title="SynergyKM" src="http://tjun.jp/blog/wp-content/uploads/2009/11/SynergyKM-1-300x244.jpg" alt="SynergyKM" width="300" height="244" />
<h3>クライアント側の設定</h3>
<ul>
	<li>generalでConnect to a shared keyboard and mouse　にチェック</li>
	<li>server configurationで正しくホスト名をチェック</li>
	<li>Enable bonjourにチェック</li>
</ul>
これで両方でapply nowやって，generalで "Turn Synergy On"をやると，正しくいけばつながります．

両者でのクリップボードの共有もできるみたいで，デスクトップからノートにコピペとかできます．

日本語のキーボードを正しく認識できないため．クライアント側では英数キーではなくCmd + spaceで変換してます．
