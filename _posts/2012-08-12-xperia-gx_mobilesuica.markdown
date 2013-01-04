---
layout: post
status: publish
published: true
title: Xperia GXでモバイルSuicaログインできない時は
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1241
wordpress_url: http://tjun.jp/blog/?p=1241
date: 2012-08-12 01:31:14.000000000 +09:00
categories:
- Diary
- android
tags:
- xperia
keywords:
- xperia, suica, android
comments: []
---
Xperia GXちょっと前に買いました。

SuicaからモバイルSuicaへの移行をしたあと、モバイルSuicaを起動したらTopの画面は表示されるけど、チャージとかのためにログイン画面に行くと真っ白な画面が出てしまって、操作ができず困ってました。


それを直すには、
<strong>設定 &rarr; 開発者向けオプション &rarr; GPUレンダリングを使用 のチェックを外す
</strong>をすると直りました。

これよく起きる問題なんでしょうか。
なんでそれが影響するのかよくわからないけど、とりあえず解決してよかった。
