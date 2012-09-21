--- 
layout: post
title: "Wordpress\xE3\x81\xA7pre\xE5\x86\x85\xE3\x81\xAE\xE3\x81\xAF\xE3\x81\xBF\xE5\x87\xBA\xE3\x81\x99\xE9\x83\xA8\xE5\x88\x86\xE3\x82\x92\xE8\x87\xAA\xE5\x8B\x95\xE7\x9A\x84\xE3\x81\xAB\xE6\x8A\x98\xE3\x82\x8A\xE8\xBF\x94\xE3\x81\x99"
wordpress_id: 957
wordpress_url: http://tjun.jp/blog/?p=957
date: 2011-09-25 18:21:05 +09:00
---
preタグというのは、以下のようなやつです。
自分は、ブログでコマンドや設定を書く際に使っています。
<pre>
testtest
</pre>

プログラムを書くときは、syntaxhighlighterというプラグインを使っています。

で、preタグを使うとき１行が長いとそのまま枠からはみ出してしまう、という問題があったのでcssを修正しました。

[css]
pre {
    /*これまでの設定に以下を追加*/
    overflow: auto;
    white-space: pre-wrap;
    word-wrap: break-word;
}
[/css]
（↑これがsyntaxhighlighterです。このCSSでは全然highlightされていません。）

これで一応折り返されるようになりましたが、IE等は未確認です。
また、syntaxhighlighterで書いたコードは折り返されずにスクロールできるようになっています。

参考にしたサイト
<ul>
	<li> <a href="http://blog.daichifive.com/archives/142" title="preタグ内のコードをボックス枠内で折り返すcss | DAICHIFIVE blog">preタグ内のコードをボックス枠内で折り返すcss | DAICHIFIVE blog</a></li>
</ul>

