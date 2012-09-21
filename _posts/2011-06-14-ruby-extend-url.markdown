--- 
layout: post
title: "ruby\xE3\x81\xA7\xE7\x9F\xAD\xE7\xB8\xAEURL\xE3\x81\xAE\xE5\xB1\x95\xE9\x96\x8B"
wordpress_id: 890
wordpress_url: http://tjun.jp/blog/?p=890
date: 2011-06-14 08:21:51 +09:00
---
<strong>※2012/03/27 追記
この記事の方法は今は使えなくなってるかもしれません。
その場合は、
<a href="http://higelog.brassworks.jp/?p=2073">Rubyで短縮URLを展開 | ひげろぐ</a>
を見てみてください。
</strong>

rubyで「bit.ly/******」などの短縮URLを展開したいときは、<a href="https://github.com/shokai/hugeurl">hugeurl</a>が使えます。

<h2>インストール</h2>
<pre>
gem install hugeurl
</pre>

<h2>使い方</h2>
<pre>
require 'rubygems'
require 'hugeurl'
puts URI.parse("http://bit.ly/iZhgER").to_huge
</pre>

これで展開されたURLが取得できます。簡単で便利です。


追記
短時間にたくさん使うと、エラーが出ることがあります。
そういうときは

<a href="http://codnote.net/2011/01/03/ruby-url-expand-is-strange/">RubyでURL短縮展開のコードがきもいです… | cod.note</a>

も使えます。


<h3>参考にしたサイト</h3>
<ul>
	<li><a href="http://shokai.org/blog/archives/5363">橋本商会 » hugeurlというgemを作った</a></li>
	<li><a href="https://github.com/shokai/hugeurl">shokai/hugeurl - GitHub</a></li>
	<li><a href="https://rubygems.org/gems/hugeurl">hugeurl | RubyGems.org | your community gem host</a></li>
</ul>


