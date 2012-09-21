--- 
layout: post
title: "Things\xE3\x81\xAE\xE3\x83\x87\xE3\x83\xBC\xE3\x82\xBF\xE3\x82\x92Dropbox\xE3\x82\x92\xE4\xBD\xBF\xE3\x81\xA3\xE3\x81\xA6\xE5\x85\xB1\xE6\x9C\x89\xE3\x81\x99\xE3\x82\x8B"
wordpress_id: 135
wordpress_url: http://tjun.jp/blog/?p=135
date: 2009-11-17 21:38:44 +09:00
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

cp &lt;code&gt;~/Library/Application\ Support/Cultured\ Code/Things/* ~/Dropbox/conf/things/&lt;/code&gt;

[/code]
次に</pre>
<h3>元のデータを消してリンクを貼る</h3>
[code]

rm -r?&lt;code&gt;~/Library/Application\ Support/Cultured\ Code/Things&lt;/code&gt;

ln -s &lt;code&gt;ln -s ~/Dropbox/conf/things ~/Library/Application\ Support/Cultured\ Code/Things&lt;/code&gt;

[/code]

これで元のmacでThingsを起動できるか確認します．

そのあとは，別のmacで

[code]

rm -r?&lt;code&gt;~/Library/Application\ Support/Cultured\ Code/Things&lt;/code&gt;

ln -s?&lt;code&gt;ln -s ~/Dropbox/conf/things ~/Library/Application\ Support/Cultured\ Code/Things&lt;/code&gt;

[/code]

をやればよいと思います．
