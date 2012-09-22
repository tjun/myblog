---
layout: post
status: publish
published: true
title: rubyで短縮URLの展開
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 890
wordpress_url: http://tjun.jp/blog/?p=890
date: 2011-06-14 08:21:51.000000000 +09:00
categories:
- programming
- ruby
tags:
- ruby
comments:
- id: 399
  author: Rubyで短縮URLを展開 | ひげろぐ
  author_email: ''
  author_url: http://higelog.brassworks.jp/?p=2073
  date: '2012-03-26 15:00:15 +0900'
  date_gmt: '2012-03-26 06:00:15 +0900'
  content: ! '[...] rubyで短縮URLの展開 | tjun memo  [...]'
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

<a href="http://codnote.net/2011/01/03/ruby-url-expand-is-strange/">RubyでURL短縮展開のコードがきもいです&hellip; | cod.note</a>

も使えます。


<h3>参考にしたサイト</h3>
<ul>
	<li><a href="http://shokai.org/blog/archives/5363">橋本商会 &raquo; hugeurlというgemを作った</a></li>
	<li><a href="https://github.com/shokai/hugeurl">shokai/hugeurl - GitHub</a></li>
	<li><a href="https://rubygems.org/gems/hugeurl">hugeurl | RubyGems.org | your community gem host</a></li>
</ul>


