--- 
layout: post
title: "\xE3\x83\xA0\xE3\x83\xBC\xE3\x83\x93\xE3\x83\xBC\xE3\x83\xA1\xE3\x83\xBC\xE3\x82\xAB\xE3\x83\xBC\xE3\x81\xA7avi\xE3\x82\x92\xE7\xB7\xA8\xE9\x9B\x86\xE3\x81\x99\xE3\x82\x8B\xE3\x81\xA8\xEF\xBC\x8C\xE4\xB8\x8B\xE5\x8D\x8A\xE5\x88\x86\xE3\x81\x8C\xE7\xB7\x91\xE3\x81\xAB\xE3\x81\xAA\xE3\x82\x8B\xE3\x82\xA8\xE3\x83\xA9\xE3\x83\xBC\xE3\x82\x92\xE8\xA7\xA3\xE6\xB1\xBA"
wordpress_id: 385
wordpress_url: http://zzz.jeeet.net/?p=94
date: 2008-09-14 02:50:29 +09:00
---
自分の環境はwindow vista．
今回はムービーメーカーを使って動画の編集をしたら画面の下半分が緑色になってしまうっていうエラーの解決方法を紹介します．

自分の場合，自分で撮った動画(拡張子はavi)を，youtubeにアップするために時間を10分以内に抑える必要がありました．

ムービーメーカで編集すると，動画が縦が半分に圧縮されて下半分が緑の画面になる，というおかしなことになりました．何度やっても同じ．

googleであれこれ調べて，解決法が見つかりました．

参考：<a href="http://www.bernzilla.com/item.php?id=884">Fixing the Green Bar Problem in Windows Movie Maker</a>

まず，「<strong>スタートメニュー</strong>」→「<strong>すべてのプログラム</strong>」→「<strong>xvid</strong>」から「<strong>Configure Decoder</strong>」を開きます．
そこで「<strong>output</strong>」というオプションの中から「<strong>Compatibility Renderer</strong>」にチェックをいれ，「<strong>OK</strong>」を押します．

そしてムービーメーカーを再起動してからムービーの発行を行えば，ちゃんとムービーが発行できます．
