--- 
layout: post
title: "\xE5\x90\x84\xE3\x82\xB5\xE3\x83\x96\xE3\x83\x87\xE3\x82\xA3\xE3\x83\xAC\xE3\x82\xAF\xE3\x83\x88\xE3\x83\xAA\xE3\x81\xAE\xE3\x82\xB5\xE3\x82\xA4\xE3\x82\xBA\xE3\x82\x92\xE8\xA6\x8B\xE3\x82\x8B"
wordpress_id: 91
wordpress_url: http://tjun.jp/blog/2009/10/%e5%90%84%e3%82%b5%e3%83%96%e3%83%87%e3%82%a3%e3%83%ac%e3%82%af%e3%83%88%e3%83%aa%e3%81%ae%e3%82%b5%e3%82%a4%e3%82%ba%e3%82%92%e8%a6%8b%e3%82%8b/
date: 2009-10-08 20:35:06 +09:00
---
Linuxで，どのディレクトリが大きいのかを見たいときのコマンド．

<p>忘れそうなのでメモ．</p>

<pre>
du -sh *
</pre>


-h はサイズを読みやすい形式（MとかGとか）に変換してくれるオプション．
-s はサマリー．これをやらないと全ての子ディレクトリが表示されちゃう．
<br />


パーティション毎のサイズを見るのは
<pre>
df -h
</pre>
です．

