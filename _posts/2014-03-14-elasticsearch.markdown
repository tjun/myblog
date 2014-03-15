---
layout: post
category: programming
title: jekyllのblogをelasticsearchで検索する
date: 2014-03-14
description: 
keywords: elasticsearch, jekyll
---

ふと、blog内検索できるようにしようかなと思い、elasticsearchを触ってみました。
ブログ上部の検索フォームから検索できるようになりました。たぶん自分くらいしか使わないけど。
一応その記録を残しておきます。長いです。

## はじめに

最初に簡単に説明すると、[Elasticsearch](http://www.elasticsearch.org/)というのは、Apache solrみたいな検索エンジンで、複数台でクラスタ組んだりできます。
Apache Luenceがベースなのはsolrと一緒で、RESTなAPIから操作できます。
最近ver.1.0がリリースされ、情報をよく見るようになってきました。
[kuromoji](http://www.atilika.org/)という形態素解析ライブラリと合わせて使うと、日本語の全文検索ができるようになります。
まだ中身をよく分かってないので、正しくない部分があるかもしれません。

そして[Jekyll](http://jekyllrb.com/)はMarkdownで書いた記事を、htmlに変換するやつで、github pageにも使われていてrubyで書かれていてプラグインもrubyで書けます。
今までは手元でこの変換(=jekyll の build) をやってからアップロードしてnginxでhostする、ということをやってました。

![jekyll-nginx](/blog/img/2014/03/jekyll-nginx.png)

## システムの構成を考える

まずelasticsearchはサーバ上で動かします。ngnixで今までどおりサーバ上で静的なファイルをホストします。
そのような構成でelasticsearchを使った検索を実現するにあたり以下のような課題があります

1. どうやってelasticsearchに記事のデータを入れるか
 * 新しい記事を追加するだけでなく、記事の一部を修正したり、過去の記事を消すこともある
2. どうやってelasticsearchにクエリを投げるか
 * できればnode.jsなど他のサーバは立ち上げたくない
 * サーバの外からelasticsearchにクエリを投げる場合、searchはいいけどデータの追加/削除などを外からできる状態にしたくない

それぞれどうやったかを一言で言うと、

* 1つ目については、jekyllのプラグインにしてビルド時に全上書き&消えてるエントリは削除する
* 2つ目は、クライアントJavascriptからクエリ投げて、nginxでsearchだけリバースプロキシ通してelasticsearchへ問い合わせる

という感じです。
以下はその詳しい説明になります。

## jekyllの記事をelasticsearchに追加する

elasticsearchにそれぞれの記事の、タイトル、URL、書いた日、そして本文、を登録します。
いろいろやり方はあると思いますがjekyllの記事を全て舐める処理を実現する方法としては、jekyllのプラグインを作るのがよいと思います。
[jekyllのPluginのドキュメント](http://jekyllrb.com/docs/plugins/)を読むとpluginには3種類あって、その中でもGeneraterプラグインを作ればjekyllのビルドの際に、全ての記事に対する処理を書くことができます。
その際に、新しい記事を見つけてelasticsearchに追加するだけなら簡単ですが、消した記事をelasticsearchからも削除したり、記事の一部を修正したりすることもあるので、ちょっと考える必要があります。

elasticsearch上のデータが記事の更新や削除に追従するためには、

1. 毎回全レコード消して全部入れる
2. それぞれの記事の以前との差分を見て、レコードの更新/削除/追加 をする
3. 記事を全て上書きし、上書きされなかったやつを削除

という3つの方法を思いつきました。
楽なのは1で、まあ今回の場合それでもよかったんですが、本来であればelasticsearchは検索スコアなどが計算されていく？ので、あまりよいやり方ではないなと思い却下。
2はコスト高い感じするので却下。3を採用しました。

3でやる場合、記事ごとにIDを決めて、更新時に同じIDの記事を上書きする、ということが必要です。もともとjekyllでは記事にidというものはついてないので、記事ごとに必ずユニークであるURLを使ってIDを生成し、これもelasticsearchに登録します。
また、jekyllのビルド時に時刻を取得して各レコード更新時ににその日時を記録しておくことで、各レコードが今回のビルドで更新されたか否かが分かり、更新されていない記事を削除します。

　  

次に、どのようにして手元の記事をサーバ上のelasticsearchへ登録するか、を考えます。
考えたのは次の3通りです。

1. 手元のマシンでjekyllのビルドをやり、その際に手元のマシンからelasticsearchへ直接データを登録する
2. jekyllのビルドもサーバ上で行い、elasticsearchへの登録もサーバ上でやる
3. jekyllのビルドは今まで通り手元で行い、その際になんらかの中間データを作ってそれをサーバに上げて、elasticsearchへのデータの登録はサーバから行う

1はサーバの外からのデータの追加/削除処理が可能な状態となるのが少し嫌。なんらかの適切なアクセス制限をつけられるなら、1がよいかもしれない。
2はビルドとデプロイの流れを少し変える必要がある。少し前に設定したcapistranoの手順をいろいろ直さなきゃいけない。
3は、jekyllのプラグインで中間データを作り、別の手段(例えばcapistranoの処理)でelasticsearchへのデータの投入を行う必要がある。
最初は3にしようと思ってたけど、なんかスマートじゃない感じがして、結局2になった。

以上でデータをelasticsearchに入れる方法が決まりました。
記事を書いたらgithubにpushして、サーバではgit pullしてjekyllビルドして、elasticsearchの更新をします。

![jekyll-es](/blog/img/2014/03/jekyll-es.png)

つまりjekyllのプラグインがやることは、
更新日時を決める→ 全ての記事に対する処理として、タイトル、URL、書いた日、本文、を抽出し、URLからIDを決める。
elasticsearchに、ID、タイトル、URL、書いた日、本文、更新日時を追加する（既に同じIDがあれば上書きされる）。
最後に、更新日時が今回のものより古いレコードを検索して、それを削除する、　となる。

そうしてできたのが、[これ](https://github.com/tjun/myblog/blob/master/_esplugin/elasticsearch.rb)です。
jekyllのconfig.ymlにサーバの設定などを出してます。
日本語検索ができるようにanalyzerの設定をしています。
この辺は、

* [Elasticsearchとkuromojiでちゃんとした日本語全文検索をやるメモ - elasticsearch | GMOメディア エンジニアブログ](http://tech.gmo-media.jp/post/70245090007/elasticsearch-kuromoji-japanese-fulltext-search)

などを参考にしました。
ここまでで、データの追加はできました。

## elasticsearchからデータを検索する

最初に書いたように、他のプロセスを立ち上げるのがなんとなく嫌だったので、クライアントサイドのjavascriptでやることにします。
[elasticsearch.jsのドキュメント](http://www.elasticsearch.org/guide/en/elasticsearch/client/javascript-api/current/index.html)を見るとなんとなく使い方が分かりますが、Javascriptをちゃんと書いたことがないので結構ハマりました。
元々bootstrapに合わせてjQueryを使っていたので、JQuery用のelasticsearch.jsを利用します。
で、[こんな感じ](https://github.com/tjun/myblog/blob/master/js/jekyll-elasticsearch.js)のJavascriptになりました。HTMLベタに書いていたりしてどう見ても下手くそな感じがしますが、とりあえず動くので今回はOKにしました。

クライアントサイドのjavascriptで検索をやると問題になるのは、外からelasticsearchにPOSTできるようにしなきゃならないってことです。
elasticsearchが動くポート(デフォルトでは9200)を開けておくと、データの更新や削除までできてしまって嫌なので、searchだけ通したい。
そこでnginxを経由してelasticsearchにクエリを投げて、nginxでsearchだけ通して結果を受け取れるようにします。
nginxの設定には、だいたい次のような設定を書くとOKです。

    server {
      listen 8080;
    
      server_name               tjun.org;
      server_name_in_redirect   off;
      access_log                /var/log/nginx/tjun.org.8080.access.log ltsv;
      error_log                 /var/log/nginx/tjun.org.8080.error.log;
      charset                   utf-8;
     
      location ~/\.ht {
        deny all;
      }
    
      location ~ ^/.*/_search$ {
        proxy_pass http://127.0.0.1:9200;
        proxy_read_timeout 90;
      }
    }

最初はポートではなく、locationで分けようとしてハマってしまったので(301になってPOSTがGETに変わってelasticsearchへ届く)、違うポートで受けることにしました。

## その他

capistranoの処理を変えてました。
デプロイのときはgithubから最新のものを取ってきて、サーバでビルドしてnginxがホストするディレクトリに置いてからelasticsearchを更新します。
また、今回作ったelasticsearch用のプラグインですが、そのまま`_plugin`ディレクトリに入れてるとjekyllでpreviewしながら少し修正して、ということをやるとそのたびにelasticsearchの更新が走ってうざい感じになるので、別の`_esplugin`というディレクトリに入れました。
elasticsearchの更新をしたいときだけ `--plugin` オプションでプラグインディレクトリを指定してjekyll のbuildをします。

## まとめ

elasticsearchを使った検索が動くようになりました。
[http://tjun.org/search.html?q=新年](http://tjun.org/search.html?q=新年)
  などとすると確かに日本語も検索できているようです。

### 参考にしたページ

* [Elasticsearchチュートリアル - 不可視点](http://code46.hatenablog.com/entry/2014/01/21/115620)
* [Elasticsearchとkuromojiでちゃんとした日本語全文検索をやるメモ - elasticsearch | GMOメディア エンジニアブログ](http://tech.gmo-media.jp/post/70245090007/elasticsearch-kuromoji-japanese-fulltext-search)
* [kibana/sample/nginx.conf at master · elasticsearch/kibana](https://github.com/elasticsearch/kibana/blob/master/sample/nginx.conf)
* [jekyll Plugins](http://jekyllrb.com/docs/plugins/)
* [elasticsearch.js [1.5]](http://www.elasticsearch.org/guide/en/elasticsearch/client/javascript-api/current/index.html)

