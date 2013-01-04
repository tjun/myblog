---
layout: post
category: 
title: blogをwordpressからjekyllへ移行しました
date: 2012-10-25
summary: ブログをwordpressからjekyllへ移行したメモ
---

ブログを移行しようと決めたのは、[俺の最強ブログ システムが火を噴くぜ - てっく煮ブログ](http://tech.nitoyon.com/ja/blog/2012/09/20/moved-completed/)を見たのがきっかけです。

wordpressは4年くらい使っていました。プラグインやテーマが豊富なので、いろいろ試すにはとてもよかったんけど、最近はテーマも固定でプラグインも固定していたので、少しオーバースペックだった。  
nginx、PHP、MySQLのチューニングしたりするのも勉強になったからよかったですが、もうやめて、静的なページを返すだけのシンプルな構成にしたいなと。


移行の流れは、

1. wordpressのデータをMySQLからぶっこ抜いてコンバートする
2. 記事のテンプレート作る
3. CSS作る
4. 確認する


jekyllの基本的な部分に加えて、

* RSSを追加したい
* sitemapは作っておきたい
* コメントはいらないような気もするけど、一応facebookのコメントをつけた。でもコメントがついてることが分からない。
* スマホでも見れるようにしたい
* サイト内検索は自分で使いたいことがあるから欲しい

みたいなことをやりました。


### 目次
* 参考にしたサイト
* wordpressからの移行
* レスポンシブデザイン
* Rakefile
* マークダウンエディタ
* まとめ

### 参考にしたサイト
jekyllの大まかな流れは、以下のサイトを参考にした。

* [俺の最強ブログ システムが火を噴くぜ - てっく煮ブログ](http://tech.nitoyon.com/ja/blog/2012/09/20/moved-completed/)
* [俺の最強ブログシステムも火を噴いてたぜ - Webtech Walker](http://webtech-walker.com/archive/2012/09/fired-myblog.html)
* [Jekyll \| CSS Radar \| Mini Books For Front End Developers](http://css.studiomohawk.com/jekyll/2011/06/11/jekyll/)
* [WordPressよりjekyllで本格的ブログを作りたくなる、かもしれないまとめ \| ゆっくりと…](http://tokkono.cute.coocan.jp/blog/slow/index.php/programming/making-blog-with-jekyll/)
* [Jekyll関連リンク詰め合わせ - ナマアシタノム](http://d.hatena.ne.jp/ashitano244/20120921/1348157402)

この辺り見ながらやれば、できると思う。
    
    
### wordpressからの移行
基本的には、[Blog Migrations · mojombo/jekyll Wiki](https://github.com/mojombo/jekyll/wiki/Blog-Migrations)に書いてある通りにやると、wordpressのデータをjekyllに持ってこれる。
でもそれだけじゃうまくいかず、ハマったことがあります。

1. wordpressから持ってきた記事のタイトルがおかしい
2. syntaxHighlighterっていうプラグイン用に書いてた部分がそのままじゃ使えない
3. 画像がケータイ向けサイズのものしか残ってない
4. プラグインに頼ってた部分をどうするか

#### wordpressから持ってきた記事のタイトルがおかしい
これはちょっと忘れちゃったんだけど、jekyllの記事内にはYAMLが書かれていて、そこがURLエンコードされてないかなんかでおかしくなっちゃってた。
ruby1.9.3なら問題ないけど、1.9.2なら発生する。対処は簡単で
{% highlight ruby %}
 require 'rubygems'
 require 'sequel'
 require 'fileutils'
+require 'psych'
 require 'yaml'
{% endhighlight %}
て感じで `require 'psych'`を`require 'yaml'`の前に追加するとOKです。

pull requestを送ったけど放置されています。


#### syntaxHighlighterというプラグイン向けに書いてた部分の移行

wordpressにはsyntaxhighlighter とかいう便利なプラグインがあって、ブログ中にコード書いて良い感じにハイライトしてくれる。例えばrubyのコードなら、[ruby][/ruby]で囲んだりすればOK。たしかそんな感じ。

これが、他の書き方もできるみたいで、いろいろな書き方でブログの記事中に散らばってた。
これはwordpressからの移行ではもちろん変換してくれないので、結局全部の記事に対して正規表現でひっかけて置換するっていう面倒なことをやりました。

jekyllでは、pygmentsていうのを使ったcode highlightが使えます。

* [Liquid Extensions](https://github.com/mojombo/jekyll/wiki/liquid-extensions)

rubyなら、{{ "{% highlight ruby " }}%} {{ "{% endhighlight " }}%} で囲みます。

#### 画像がケータイ向けサイズのものしか残ってない
これはたぶんケータイ向けプラグインが原因なんだけど、uploadディレクトリにあるはずの画像の一部が、小さい画像しか残ってなくて、原因がよく分かんないです。諦めて追ってないです。

#### プラグインに頼ってた部分をどうしよう
スマホ対応とか、ソーシャルボタンとか、google analyticsとか、コメントとかタグ付けとか、SEOとか、いろいろプラグインでやっていて、全部は移行できないし全部必要でもなかったので、必要な部分だけjekyll に合わせて自分でやりました。  
    
    
### レスポンシブデザイン
スマホでもおなじHTML, CSSで対応したかったので、画面サイズに合わせて変わるようなCSSにしてみたつもりですが、今Xperiaから見てみたら全然だめでした。
フレームワークはなんとなくその時知った[Kube](http://imperavi.com/kube/)を使っています。他のフレームワークと比べてどうなのかは知りません。初めてscssも使ってみました。

IEだと表示が崩れることを確認しましたが、これでも結構直しました。
IEどうでもいいか、とも思ったけどアクセスみるとIEが2割程度いるので一応確認はしています。

デザインはセンスないので、白と黒だけならそんなに失敗することはない、とデザイナの人が言ってたのを守っています。
    
    
### アップロードとRakefile
元の記事では一度githubにアップして、それをhookしてサーバはデータをgithubから取得、という流れでやってます。でも、めったに書かないブログに記事の更新のためにCGIなどのプロセスを上げ続けるのも嫌だったので、直接サーバにアップロードすることにしました。

アップロードもそうですが、他にも新たな記事を書いたりプレビューしたり、という処理をするためのrakefileを作っています。
参考にしたのは、上に書いた他に[ブログ用にRakefile使ってみた | jekylog](http://fingaholic.github.com/posts/2012-04-25-rakefile.html) などを参考にしました。

{% highlight ruby %}

# Usage: rake preview
desc "Build files and launch preview server"
task :preview do
  sh "open -a 'Google\ Chrome' 'http://localhost:4000'"
  sh "jekyll --server --auto"
end

# Usage: rake post["title"]
desc "Create a new post file with title"
task :post do
  print 'title :'
  title = STDIN.gets.strip
  dirname = File.join(".", "_posts")
  if not FileTest.directory?(dirname)
    abort("rake aborted: #{dirname} directory not found.")
  end
  date = Time.now.strftime('%Y-%m-%d')
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  filename = "#{date}-#{slug}.md"
  fullpath = File.join(dirname, filename)

  if File.exist?(fullpath)
    abort("rake aborted: #{fullpath} already exists.")
  end

  File.open(fullpath, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "category: "
    post.puts "title: #{title}"
    post.puts "date: #{date}"
    post.puts "summary: "
    post.puts "---"
  end
  #puts "Open #{fullpath} in an editor."
  sh "open -a Mou #{fullpath}"
end

#Usage: rake sass
desc "convert scss to css"
task :sass do
  sh "sass --style compressed _scss/style.scss:css/style.css"
end
{% endhighlight %}


### マークダウンエディタ

マークダウンをあまり書いたことがないので、プレビューしながら書けるMac向けMarkdownエディタを探してみたところ、[Mou](http://mouapp.com/)がよさそうな気がしました。無料だし。先ほどのRakefileで`rake post`すると直接開くようにしています。


### まとめ
そんなわけでブログをwordpressからjekyllに移行しました。とくにRSSとかあやしいので不具合あるかもです。スマホから見ずらいのは直したいと思います。  
表示は早くなったような気がします。

