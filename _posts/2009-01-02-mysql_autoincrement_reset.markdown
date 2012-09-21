--- 
layout: post
title: "MySQL\xE3\x81\xA7autoincrement\xE3\x82\x921\xE3\x81\xAB\xE6\x88\xBB\xE3\x81\x99"
wordpress_id: 402
wordpress_url: http://zzz.jeeet.net/?p=225
date: 2009-01-02 15:03:37 +09:00
---
MySQLでautoincrementを1に戻すSQL．忘れてしまうので自分のためにメモ

ALTER TABLE `テーブル名` PACK_KEYS =0 CHECKSUM =0 DELAY_KEY_WRITE =0 AUTO_INCREMENT =1;

これはレコードを全部削除したあと（delete from テーブル名;）
に行います
