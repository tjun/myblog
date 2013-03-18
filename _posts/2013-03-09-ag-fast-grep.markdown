---
layout: post
category: diary
title: ag（grepの早いやつ）を入れてみた
date: 2013-03-09
description: 
keywords: ag, grep
---
agというのは、ファイルからパターン検索するときに使えるgrepのようなやつ。
grepより早くていいと聞いたので、入れてみました。
少し使ってみて、時間も測ってみたけど、以下のサイトに速度の比較があるので省略します。かなり速く感じる。

* [Geoff's site: The Silver Searcher: Better than Ack](http://geoff.greer.fm/2011/12/27/the-silver-searcher-better-than-ack/)

**Better than Ack** とあるけど、そもそもackっていうのがあるのも知らなかった。また、コマンドは`ag` だけど、The Silver Searchという名前みたい。

使い方はgrepと全く同じではなくて、

    ag [word]

だけでカレンドディレクトリ以下をサブディレクトリ含めて検索してくれる。
また、デフォルトでgitignoreに書かれているファイルはignoreする。最初これに気づかずにgrepと結果が違って悩んでた。

もちろんgrepのように以下のようにパイプで渡して

    cat hoge.log | ag ERROR

なんてこともできます。

個人的には、grepに比べて結果がファイルごとに分けてくれて検索語がハイライトされて見やすいのがよかったです。grepもoptionとかちゃんと設定すればできるのかもしれない。

### インストール

Macなら

    brew install the_silver_searcher

でOK。
そのあと自分は、とりあえず-Sオプションを有効にするaliasを追加しました。
-Sは、smart-case、小文字だけの文字列を検索すると大文字小文字無視して検索するけど、大文字と小文字が混ざった文字列で検索すると、大文字小文字の一致まで見てくれるやつ。

おわり。

### 参考

インストールとかvimの設定とかちゃんとした使い方は以下を参考にするとよいと思う。

* [ggreer/the_silver_searcher · GitHub](https://github.com/ggreer/the_silver_searcher#how-is-it-so-fast)
* [ackを捨てて、より高速なag(The Silver Searcher)に切り替えた - Glide Note - グライドノート](http://blog.glidenote.com/blog/2013/02/28/the-silver-searcher-better-than-ack/)

