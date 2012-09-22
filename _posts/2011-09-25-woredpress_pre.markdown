---
layout: post
status: publish
published: true
title: Wordpressでpre内のはみ出す部分を自動的に折り返す
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 957
wordpress_url: http://tjun.jp/blog/?p=957
date: 2011-09-25 18:21:05.000000000 +09:00
categories:
- wordpress
tags:
- wordpress
- css
comments: []
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
（&uarr;これがsyntaxhighlighterです。このCSSでは全然highlightされていません。）

これで一応折り返されるようになりましたが、IE等は未確認です。
また、syntaxhighlighterで書いたコードは折り返されずにスクロールできるようになっています。

参考にしたサイト
<ul>
	<li> <a href="http://blog.daichifive.com/archives/142" title="preタグ内のコードをボックス枠内で折り返すcss | DAICHIFIVE blog">preタグ内のコードをボックス枠内で折り返すcss | DAICHIFIVE blog</a></li>
</ul>

