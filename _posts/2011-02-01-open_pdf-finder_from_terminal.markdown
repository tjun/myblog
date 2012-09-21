--- 
layout: post
title: "[mac]\xE3\x82\xBF\xE3\x83\xBC\xE3\x83\x9F\xE3\x83\x8A\xE3\x83\xAB\xE3\x81\x8B\xE3\x82\x89pdf\xE3\x82\x92\xE9\x96\x8B\xE3\x81\x8F\xE3\x80\x81finder\xE3\x82\x92\xE9\x96\x8B\xE3\x81\x8F"
wordpress_id: 740
wordpress_url: http://tjun.jp/blog/?p=740
date: 2011-02-01 22:30:07 +09:00
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
