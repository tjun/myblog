--- 
layout: post
title: "Latex\xE3\x81\xAB\xE3\x83\x97\xE3\x83\xAD\xE3\x82\xB0\xE3\x83\xA9\xE3\x83\xA0\xE3\x81\xAE\xE3\x82\xBD\xE3\x83\xBC\xE3\x82\xB9\xE3\x82\xB3\xE3\x83\xBC\xE3\x83\x89\xE3\x82\x92\xE8\xBC\x89\xE3\x81\x9B\xE3\x82\x8B\xE6\x96\xB9\xE6\xB3\x95"
wordpress_id: 369
wordpress_url: http://zzz.jeeet.net/?p=49
date: 2008-06-06 00:19:46 +09:00
---
Latexにプログラムのソースコードを載せたいとき，そのまま書いたらインデントなどが消えてしまいます．

<span style="color: #ff0000;">※ちゃんとやる方法を追記</span>
検索して来る人が多いので、ちゃんとしたソースコードの載せ方へのリンクを貼っておきます。

行数などをつけてプログラムを追記したい場合には、listingというパッケージを利用します。
コメントに色をつけたりなどもできます。
以下のサイトで詳しく説明されています。
<ul>
	<li><a href="http://d.hatena.ne.jp/mallowlabs/20061226/1167137637">jlistingでソースコードを綺麗に表示する - mallowlabsの備忘録</a></li>
	<li><a href="http://blog.santalinux.net/?p=135">Logwatch for santa » TeXでソースコードを貼り付ける</a></li>
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
