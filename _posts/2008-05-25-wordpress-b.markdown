---
layout: post
status: publish
published: true
title: Wordpressで改行を思い通りに行うプラグイン
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 364
wordpress_url: http://zzz.jeeet.net/?p=35
date: 2008-05-25 12:04:53.000000000 +09:00
categories:
- tips
- wordpress
tags:
- plugin
- wordpress
comments: []
---
<div class="zemanta-img" style="margin: 1em; float: right;"><a href="http://commons.wikipedia.org/wiki/Image:Enter.png" target="_blank"><img style="border: medium none; display: block;" src="http://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Enter.png/202px-Enter.png" alt="Return/Enter buttons on a keyboard." /></a>
<p class="zemanta-img-attribution">Image via <a href="http://commons.wikipedia.org/wiki/Image:Enter.png" target="_blank">Wikipedia</a></p>

</div>
Wordpressを使っていると，エディタ画面で「Enter」キーを押してもその数だけ改行されないので，思い通りの見た目にするのが難しいと感じることがあります．もっとmixiのエディタのように，エディタ画面で「Enter」キーを押した数だけ改行して欲しい，そういうときに使えるプラグインがあるので紹介します．

そのプラグインとは，<a href="http://camcam.info/wordpress/101"><span style="color: #ff6600;"><strong>brBrbr</strong></span></a>です．日本の方が作ったようで，左記のページに行けば日本語で説明があるので大丈夫だと思うのですが一応説明．

ダウンロードしたzipファイルを解凍して，<span style="color: #ff6600;"><strong>brBrbr.php</strong></span>というphpファイルを<strong>/wp-content/plugins/</strong>にアップロードすればok．

ビジュアルエディタでも使うには，<strong>/wp-includes/formatting.php</strong>を修正します．

wordpress2.5では1126行目にある<strong><span style="color: #ff6600;">wpautop($output)</span></strong>を<span style="color: #ff6600;"><strong>brBrbr($output)</strong></span>に書き換えればok．
<pre>
　　　　　1124    $output = $text;
　　　　　1125    $output = convert_chars($output);
　　　　　1126    $output = brBrbr($output)</pre>



これで思い通りの改行ができます．でもどうもビジュアルエディタだとうまくいかない部分があるので，そういうときはhtmlエディタを使用して，改行したい部分に「Enter」キーを使って改行をいれましょう．

また上のように＜pre＞＜/pre＞の間に変な改行が入ってしまいます．直したければ，スタイルシートをいじってpreの文字間隔をマイナスにすれば解決すると思われます．

<a href="http://camcam.info/wordpress/101">Wordpress改行プラグイン @ CamCam</a>

<div class="zemanta-pixie" style="margin: 5px 0pt; width: 100%;"><a class="zemanta-pixie-a" title="Zemified by Zemanta" href="http://www.zemanta.com/"><img class="zemanta-pixie-img" style="border: medium none; float: right;" src="http://img.zemanta.com/pixie.png?x-id=d9aa77dd-07e5-42a1-8a65-b7c1c3450263" alt="" /></a></div>
