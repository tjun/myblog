---
layout: post
status: publish
published: true
title: ThingsのデータをDropboxを使って共有する
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 135
wordpress_url: http://tjun.jp/blog/?p=135
date: 2009-11-17 21:38:44.000000000 +09:00
categories:
- mac
tags:
- mac
comments: []
---
ThingsっていうTo Doアプリを使い始めました．

<a href="http://culturedcode.com/things/">Things - task management on the Mac</a>

iPhoneとの同期はできるけど，２台のMac間での同期はしてくれないということで，Dropboxにデータを置くことで共有をさせます．

参考にしたのは

<a href="http://www.tuaw.com/2009/10/10/tips-and-tricks-putting-things-in-your-dropbox-makes-syncing-si/">Tips and tricks: Putting Things in your Dropbox makes syncing simple</a>
<h3>まず，Thingsを終了させる．</h3>
<h3>次に，元となるThingsのデータを移動させる．</h3>
そのために，移動先のディレクトリをDropbox内に作る

（自分はDropbox/conf/things　というディレクトリを作りました．）

で ，ターミナルで

[code]

cp <code>~/Library/Application\ Support/Cultured\ Code/Things/* ~/Dropbox/conf/things/</code>

[/code]
次に</pre>
<h3>元のデータを消してリンクを貼る</h3>
[code]

rm -r?<code>~/Library/Application\ Support/Cultured\ Code/Things</code>

ln -s <code>ln -s ~/Dropbox/conf/things ~/Library/Application\ Support/Cultured\ Code/Things</code>

[/code]

これで元のmacでThingsを起動できるか確認します．

そのあとは，別のmacで

[code]

rm -r?<code>~/Library/Application\ Support/Cultured\ Code/Things</code>

ln -s?<code>ln -s ~/Dropbox/conf/things ~/Library/Application\ Support/Cultured\ Code/Things</code>

[/code]

をやればよいと思います．
