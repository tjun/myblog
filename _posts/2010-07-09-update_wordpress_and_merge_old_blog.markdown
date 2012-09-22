---
layout: post
status: publish
published: true
title: Wordpressのアップデートと古いblogの記事移転
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 500
wordpress_url: http://tjun.jp/blog/?p=500
date: 2010-07-09 18:09:19.000000000 +09:00
categories:
- Diary
- wordpress
tags:
- mysql
- Diary
- wordpress
comments: []
---
Wordpress3.0導入　と　古いブログのマージ。
古いブログのRSSをsubscribeしている人もこれからのfeedが届くのかもしれない。

移行めも。

Wordpress3.0にしたかったんだけど、使っているレンタルサーバのMySQLのバージョンが4.xだったからできずにいた。
でも実はレンタルサーバでMySQL5.1も利用可能だったので、MySQLのバージョン変えるところからやりました。

レンタルサーバーではphpmyadminのインターフェースがあったので、そこからdbをSQLでエクスポートして、WordPressの管理画面からデータもエクスポートして、データベースを削除して、新たにMySQL5.1でデータベース作って、さっきエクスポートしたSQLをインポート。

しかしここで<strong>same database exits</strong>のエラーが。
ということで、エクスポートしたSQLをエディタで開いて、"<strong>CREATE DATABASE ***</strong>"の部分をコメントアウト。
またインポートしようとすると今度は <strong>USE dbname</strong> の部分でsql構文エラーが。
エクスポートしたSQLのdb nameがbackquoteで囲まれていないのが原因で、 <strong>USE `dbname`</strong>に修正。

これでインポート成功。
あとはwp-config.phpのdb serverを書き換え。これで今まで通りになった。
あとはWordPressの管理画面からWordpress3.0-jaに自動アップデートを実行。これもうまくいった。


で、このブログの前にやっていたブログが少しアクセスがあるけど放置状態だったので、そこの記事をこのブログにマージすることに。

前のブログもwordpressで、記事へのurlのパーマリンク設定が同じだったからできました。

まず古いブログでWordpressから記事のエクスポートをして、このブログの管理画面からインポート。
で、古いブログからのリダイレクトのため、古いブログの.htaccessに
<pre>
Redirect permanent / http://tjun.jp/blog/
</pre>
を記述。
これで、古いブログへのアクセスが全て今のブログに飛ばされます。
URLの構造が違っているとだめなので、パーマリンク設定が同じである必要があるような気がします。

グーグルのインデックスとか、はてブとかがどうなるのかがよく分からん。
現状でも、古い記事に情報を探しに来た人が、ちゃんと目的の情報に行けるはずなのでとりあえずいいか。
