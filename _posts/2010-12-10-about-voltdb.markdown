---
layout: post
status: publish
published: true
title: VoltDBについて調べてるメモ
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 698
wordpress_url: http://tjun.jp/blog/?p=698
date: 2010-12-10 03:40:59.000000000 +09:00
categories:
- db
tags:
- db
comments:
- id: 214
  author: river24
  author_email: river2470@gmail.com
  author_url: ''
  date: '2010-12-10 04:34:37 +0900'
  date_gmt: '2010-12-09 19:34:37 +0900'
  content: 勉強になります．
---
VoltDBは、オープンソースの高速なSQLデータベースです。

<a href="http://voltdb.com/">VoltDB: Fast, Scalable, Open-Source SQL DBMS with ACID</a>


関連する日本語の記事。
<ul>
	<li><a href="http://sourceforge.jp/magazine/10/05/27/033236">「NoSQL」を上回る性能を目指す次世代型高速SQLデータベース「VoltDB」登場 - SourceForge.JP Magazine : オープンソースの話題満載</a></li>

	<li><a href="http://www.nonsensecorner.com/wp25/?p=4297">独り言v6 ? VoltDB登場 ? RDBMSのようでRDBMSではない新システム</a></li>

	<li><a href="http://www.nonsensecorner.com/wp25/?p=4299">独り言v6 ? VoltDBは何故早いのかは問題ではない。何をするためのシステムなのかが問題だ</a></li>

	<li><a href="http://www.publickey1.jp/blog/10/nosqlsqlvoltdbcassnadra.html">NoSQLを超えるSQLデータベース「VoltDB」。Cassandraとベンチマーク対決！ ? Publickey</a></li>

	<li><a href="http://www.publickey1.jp/blog/10/nosqlvoltdb.html">NoSQLを上回る性能のVoltDB、そのアーキテクチャとは ? Publickey</a></li>

	<li><a href="http://www.publickey1.jp/blog/10/sql.html">SQLの都市伝説。マイケル・ストーンブレイカー御大が斬る！ ? Publickey</a></li>
</ul>



VoltDBの元になった研究「H-Store」
<ul>
	<li><a href="http://hstore.cs.brown.edu/">H-Store: A Next Generation OLTP DBMS</a></li>
</ul>


ここから論文も読めます。
<ul>
	<li><a href="http://hstore.cs.brown.edu/publications/">Publications ? H-Store</a></li>
</ul>

上から2つめの論文が短くまとまっているので、最初に読むのにいいかもしれません。


簡単に言うと、
<ul>
  <li>メモリに乗るサイズのデータであることが必要</li>
  <li>ログを作らないためデータ整合性が落ちる</li>
  <li>予め登録したクエリしか使えない</li>
</ul>
などの制約を設けることによってOLTP処理を高速化した、ということでしょうか。

DBは常に新しいモノが常にいろいろ登場して、どれが速いだとかいろいろ言われますが、どのような環境で、どのような目的で使うのか、によってどのデータベースがいいか異なるので、簡単に比べられません。

実際にいろいろ使ってみるしかないんでしょうか。
