---
layout: post
category: diary
title: LINE Developer Conference 2日目に行ってきた
date: 2014-04-17
description: LINE Developer Conference(2014) のプラットフォームの回に参加して聞いたことのメモ。
keywords: LINE, developer, conference, platform, プラットフォーム
---

![LINE](/blog/img/2014/04/line.jpg)

LINEのDeveloper Conferenceに行ってきました。
2回に分けてインフラの回とプラットフォームの回があって、プラットフォームの方に行きました。

* [LINE Developer Conference 開催のお知らせ : LINE HR Blog](http://line-hr.jp/archives/37147547.html)

LINEに行くのは初めて。ヒカリエのきれいなオフィスでした。
ブログ書いてね、といっていたので書きます。
いろいろ聞いたけど、特に興味があったPlatformの部分だけ書きます。
間違っている箇所があるかもしれません。


## LINEのPlatform

LINEには本体のメッセージアプリ以外にもLINEゲームがあり、マンガやモールなどのアプリもある。ゲームにはランキングなどの共通の仕組みがある。すべてのアプリに共通の汎用的なPlatformがあり、ChannelGatewayと呼ばれてる。
それぞれのアプリがChannelで、それらの橋渡しをするのがChannelGateway。

ChannelGatewayの機能は、AuthenticationとAPI.

### Authentication

例えばLINE StoreにはLINE Loginボタンがある。

* LINEのメアドとPWでログインできる。
* OAuth2をベースにしているが若干違う。

LINEゲームでLINEログインを押すと、LINEのアプリが立ち上がって認証して、またゲームアプリに戻る

* 認可をゲームアプリに渡す
* アプリ間通信
 * どのアプリから来たか、というクライアントの確認をしている
* 認証認可要求をLINEアプリに投げるとLINEゲームアプリもaccess tokenを獲得でき、各APIを使えるようになる

### API

LINEのAPI

* profile API
* friend list API
* send message API
* post timeline API

HTTPSのRESTfulなAPIがあり、SDKを使うと関数呼び出しだけで簡単に使える。
1日のfriend list APIのアクセス数: 1億6千万

### LINE BusinessConnect

LINEアプリをPlatformにして、例えばピザのスタンプ送ればピザの注文とかも実現できるような仕組み。

サービス提供者は、LINE platform上に公式アカウントを作ってBot Serverを作る

* とにかくシンプルで軽く作ることが重要
* まずはresponseを返す。rails のdelayed_jobのように非同期で処理する

### クライアント-サーバ間通信

LINEのクライアント/サーバ間通信はSPDYベースのプロトコル

* LINEのサーバに来るのは、LINEアプリしかいない
 * UserAgentは1つなのでprotocolのnegotiation(NPN)のオーバヘッドをなくせる
 * 環境によっては回線が遅いので、NOOP Frameという返信不要な通信開始パケットを投げてServer側をWarm Upする

※SPDYの話とかこの辺りに載ってる

* [Adopting SPDY in LINE – Part 2: The Details « LINE Engineers' Blog](http://tech.naver.jp/blog/?p=2729)

### LEGY

Line Event GatewaY のことで、Erlangで書かれている。

* LEGY Server Push
* LEGY Encryption
 * アプリに入れて配ることで鍵交換を省略する工夫?

詳しくはEngineer Blogへ

### 相手に確実に届ける仕組み(Storage)

スマホアプリに加えてDesktop版もあるので、サーバ側にメッセージ貯めてないと対応できない。
ユーザ4億で、日々増えている。やりとりされるメッセージも増え続けている。

* 開発当時はメインのstorageはRedis、MySQLも併用
* Redis ClusterでRedisを増やしていた
 * しかしRedisはOnline Storageで、メモリどんどん増やすのはコスト高い
* 代わりのstorageとして、CassandraやMongoなども試したがHBaseを採用
 * HBase HA
 * CacheにRedis
* Mongoも少し使ってる
* 統計処理のリアルタイム処理でStorm使ってる

### LINEのシステムのLayer

上から次のようなレイヤがある。

* LINE CLient
* LEGY
* Authentication
* LINE Application Layer
 * Core Messaging
 * Functional Application
 * Queue (RabbitMQ, Redis queue, ZeroMQ)
* HBase, Redis等のStorage

ネットワーク的にもいろいろなものが協調してLINEのシステムを作ってる。

### 扱ってるデータ量

* Redis: 30TB
* HBase: 1PB
* Hadoop: 7PBのシステムの42%を使ってログ解析や統計処理


## おわりに

以上です。
個人的には、LINEのシステムの全体像が知れたのがよかったです。
他にも、今までの大変だったトラブルとか、CEPを使ったモニタリングの話とか聞けて面白かったです。

ビールと食事とおみやげもよかったです。

