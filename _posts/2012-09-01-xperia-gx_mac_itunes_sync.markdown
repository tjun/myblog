---
layout: post
status: publish
published: true
title: Xperia GXにMacからiTunesの曲を入れる
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1249
wordpress_url: http://tjun.jp/blog/?p=1249
date: 2012-09-01 01:55:49.000000000 +09:00
categories:
- mac
- android
- xperia
tags:
- android
- xperia
comments: []
---
ちょっと前にiPhone 3GSからXperia GXに変えました。
MacユーザだとiTunesの曲をGXに移す方法が分からなかったので、書いておきます。
というか、最初は単純にマウントしてファイルコピーする方法さえ分からずにハマってました。

<h3>0. はじめに</h3>
データをSDカードにコピーするだけなら、
設定 &rarr; Xperia &rarr; 接続設定 &rarr; USB接続モード を MTPから MSCに変更

すると、Macとつないだ時にマウントできてデータが送れるようになります。

これだけだとプレイリストなどは移行できなくて不便です。


<h3>1. Bridge for Mac のインストール</h3>
Xperiaのサポートなぜか見ても出てこないけど、Macユーザのためのソフトがちゃんとあります。
日本語の情報も見つからなかった。
<ul>
  <li><a href="http://blogs.sonymobile.com/products/2012/01/31/are-you-a-mac-user/?utm_source=rss&utm_medium=rss&utm_campaign=are-you-a-mac-user">Are you a Mac user? &mdash; Sony Xperia Product Blog</a></li>
</ul>

ダウンロードは
<a href="http://www.sonymobile.com/global-en/tools/bridge-for-mac/">Download for Mac - Sony Smartphones (Global UK English)</a>
からできます。
普通のMacのソフトのようにインストールできます。


<h3>2. Xperiaをつなぐ</h3>
インストールしたBridge for Macを起動して、XperiaをMacに接続します。
するとこんな感じの画面になる。

<img src="http://tjun.jp/blog/wp-content/uploads/2012/09/SonyBridgeforMac.jpg" alt="SonyBridgeforMac" title="SonyBridgeforMac.jpg" border="0" width="420" height="329" />

<h3>3. 曲を同期する</h3>
ここで左のメニューからiTunesライブラリのなかのプレイリストを開いて、チェックボックスを選択して、右下の同期ボタンを押すと同期がはじまります。
一度に膨大な曲を選択したらうまく同期が進まなかったことがありましたが、それ以外は快適に音楽の同期ができるようになりました。

<img src="http://tjun.jp/blog/wp-content/uploads/2012/09/SonyBridgeforMac2.jpg" alt="SonyBridgeforMac2" title="SonyBridgeforMac2.jpg" border="0" width="420" height="329" />


Macユーザ用のソフトあるんだからちゃんと案内すればいいのに、かなり探さないと見つからないところにあるのが残念。
