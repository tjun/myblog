---
layout: post
status: publish
published: true
title: ! '[mac]ターミナルからpdfを開く、finderを開く'
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 740
wordpress_url: http://tjun.jp/blog/?p=740
date: 2011-02-01 22:30:07.000000000 +09:00
categories:
- mac
tags:
- mac
comments: []
---
今さらだけど、なぜか今までやってなかったのでメモ。

<ul>
	<li><strong>ターミナルからpdfをプレビューで開く</strong></li>
<pre>
$ open -a Preview  [開きたいpdf]
</pre>

	<li><strong>ターミナルからカレントディレクトリを開く</strong></li>
<pre>
$ open .
</pre>


.bashrcや.zshrcなどに以下を追記すると、少し簡単になります。

[shell gutter="false"]
 alias pdf='open -a Preview'
 alias finda='open .'
[/shell]

使い方はこんな感じ。
<pre>
$ pdf thesis.pdf
$ finda
</pre>


ときどき便利。
