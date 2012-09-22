---
layout: post
status: publish
published: true
title: Latexにプログラムのソースコードを載せる方法
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 369
wordpress_url: http://zzz.jeeet.net/?p=49
date: 2008-06-06 00:19:46.000000000 +09:00
categories:
- tips
tags:
- latex
- Tips
comments: []
---
Latexにプログラムのソースコードを載せたいとき，そのまま書いたらインデントなどが消えてしまいます．

<span style="color: #ff0000;">※ちゃんとやる方法を追記</span>
検索して来る人が多いので、ちゃんとしたソースコードの載せ方へのリンクを貼っておきます。

行数などをつけてプログラムを追記したい場合には、listingというパッケージを利用します。
コメントに色をつけたりなどもできます。
以下のサイトで詳しく説明されています。
<ul>
	<li><a href="http://d.hatena.ne.jp/mallowlabs/20061226/1167137637">jlistingでソースコードを綺麗に表示する - mallowlabsの備忘録</a></li>
	<li><a href="http://blog.santalinux.net/?p=135">Logwatch for santa &raquo; TeXでソースコードを貼り付ける</a></li>
	<li><a href="http://www.biwako.shiga-u.ac.jp/sensei/kumazawa/tex/listings.html">listings.sty: TeX パッケージ</a></li>
	<li><a href="http://mytexpert.sourceforge.jp/index.php?Listings">Listings - MyTeXpert</a></li>
</ul>
<span style="color: #ff0000;">※追記終わり</span>

以下は、とりあえずインデントがつぶれずに反映されればいいや、という簡単な方法です。
記述したとおりに表示してほしいときに使えるタグを使います。
<pre>{\small
\begin{verbatim}
--ここにコードを記述--
\end{verbatim}}</pre>
これで記述した通りに表示されるのですが，１行の文字数が長い場合にも改行をいれてくれないため，ページをはみ出してしまいます．

自分で適切な改行を入れましょう．

これで見やすいレポートができます！
