---
layout: post
status: publish
published: true
title: MySQLでautoincrementを1に戻す
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 402
wordpress_url: http://zzz.jeeet.net/?p=225
date: 2009-01-02 15:03:37.000000000 +09:00
categories:
- db
- tips
tags:
- mysql
comments: []
---
MySQLでautoincrementを1に戻すSQL．忘れてしまうので自分のためにメモ

ALTER TABLE `テーブル名` PACK_KEYS =0 CHECKSUM =0 DELAY_KEY_WRITE =0 AUTO_INCREMENT =1;

これはレコードを全部削除したあと（delete from テーブル名;）
に行います
