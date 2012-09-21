--- 
layout: post
title: "fluentd-plugin-kestrel\xE3\x82\x92\xE6\x9B\xB4\xE6\x96\xB0\xE3\x81\x97\xE3\x81\xBE\xE3\x81\x97\xE3\x81\x9F"
wordpress_id: 1137
wordpress_url: http://tjun.jp/blog/?p=1137
date: 2012-06-03 04:09:48 +09:00
---
kestrelへoutputするプラグインを以前作りました。

<ul>
	<li><a href="http://tjun.jp/blog/2012/02/fluentd-plugin-kestrel/">fluentd-plugin-kestrelを作ってみた | tjun memo</a></li>
</ul>


最近の記事やイベントでまたfluentdが盛り上がっているようなので、久しぶりにプラグインの更新をしました。
<ul>
	<li><a href="https://github.com/tjun/fluent-plugin-kestrel">tjun/fluent-plugin-kestrel</a></li>
</ul>


<ul>
	<li>以前はkestrelへのoutputだけのpluginでしたが、kestrelからの入力をできるようなinput pluginを追加しました。</li>
	<li>また、kestrelへの書き込む文字列にprefixやsuffixが付いちゃうというライブラリ依存の問題は回避できることが分かったので、そこも修正しました。</li>
	<li>outputのデータのformatを柔軟にしたかったので、<a href="https://github.com/tagomoris/fluent-plugin-file-alternative">tagomoris/fluent-plugin-file-alternative</a>を参考にさせていただいて、formatのoptionをいくつか追加しました。</li>
</ul>

これでやりたかったことは一応実装が終わりました。
inputの実装がよくないみたいでinputのテストでshutdownを呼べないため、inputの方はちゃんとテストできてません。



gemの作り方などいろいろ忘れていたのでメモ。

参考にしたのは、
<ul>
	<li><a href="http://d.hatena.ne.jp/tagomoris/20120221/1329815126">fluentdのためのプラグインをイチから書く手順(bundler版) - tagomorisのメモ置き場</a></li>
	<li><a href="http://d.hatena.ne.jp/seiunsky/20090723/1248357767">jeweler でらくらく rubygems 作成（github編） - @sugamasao.blog.title # =&gt; ”コードで世界を変えたい”</a></li>
</ul>

updateの流れは、
テストとコードを書いたら、
rake test でテスト。rake install でローカルに開発中のものをgemとしてインストールして試すこともできる。
ドキュメントを修正したら、
rake version:bump:minor や rake version:bump:patch でバージョンを上げて、
rake release で、 gitのタグ付け、githubへのコミット、rubygemsへのコミット をやってくれる。

という感じ。
