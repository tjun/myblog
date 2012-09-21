--- 
layout: post
title: "fluentd-plugin-kestrel\xE3\x82\x92\xE4\xBD\x9C\xE3\x81\xA3\xE3\x81\xA6\xE3\x81\xBF\xE3\x81\x9F"
wordpress_id: 1102
wordpress_url: http://tjun.jp/blog/?p=1102
date: 2012-02-12 03:25:39 +09:00
---
先週末くらいにTLにたくさん流れてきた"fluentd"について調べてみたらよさそうだったので、勉強を兼ねてpluginを書いてみました。
<ul>
	<li><a href="https://github.com/tjun/fluent-plugin-kestrel">tjun/fluent-plugin-kestrel - GitHub</a></li>
</ul>
fluentdっていうのは、ログを収集するツールで、プラグインでいろいろ柔軟に設定できて、複数のサーバのいろんなイベントのログを集めて使いやすい形にする、というような使い方ができるみたいです。
Scribeのようなもの。

fluentdについてもっと知りたい人に参考になるのは以下のサイトです。
<ul>
	<li><a href="https://github.com/fluent/fluentd">fluent/fluentd - GitHub</a></li>
	<li><a href="http://d.hatena.ne.jp/viver/20110929/p1">イベントログ収集ツール fluent リリース！ - 古橋貞之の日記</a></li>
</ul>


最近ちょっと触っていたKestrelというメッセージキューへログを投げられたら便利かな、ということで、fluentdで集めたログをkestrelにenqueueするpluginを作ってみました。
実装は、<a title="Fluent plugins" href="http://fluentd.org/plugin/">既にあるいろいろなプラグイン</a>を参考にしました。Gemを作るのも初めてでよく分かんなかったけど、<a href="http://d.hatena.ne.jp/tagomoris/20111117/1321511988">fluentdのためのプラグインをイチから書く手順 - tagomorisのメモ置き場</a>　や <a href="http://d.hatena.ne.jp/seiunsky/20090723/1248357767">jeweler でらくらく rubygems 作成（github編）- @sugamasao.blog.title # =&gt; ”コードで世界を変えたい”</a>の通りにやっていたらできました。

jewelerって便利。



ちゃんと<a title="rubygems.org" href="https://rubygems.org/gems/fluent-plugin-kestrel">rubygemsに登録されている</a>ので、そのうち
<pre>gem install fluent-plugin-kestrel</pre>
でインストールできるようになる、と思ってるんだけど、まだできないので何か足りないのかもしれない。

※2012/2/13追記 インストールできるようになりました。



使い方は、kestrelが動いている状態で、fluentdの設定に
<pre>&lt;match kestrel.**&gt;
  type kestrel

  host localhost     # kestrel host (required)
  queue test         # queue name of kestrel (required)

  # port 22133         # optional, default 22133
&lt;/match&gt;</pre>
のように書けばOKです。

どんな感じのデータが入ってるかというと、
<pre>$ telnet localhost 22133

get test

VALUE test2 0 125
2012-02-11T16:38:54Z	apache.access	{"host":"::1","user":"-","method":"GET","path":"/test/","code":"304","size":"-"}
END</pre>
という感じで、タブ区切りで時刻、タグ、JSONが入る感じです。

この辺のフォーマットは設定で変えられるようにしたいと思っています。
