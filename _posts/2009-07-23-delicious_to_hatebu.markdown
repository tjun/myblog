--- 
layout: post
title: "Delicious\xE3\x81\x8B\xE3\x82\x89\xE3\x81\xAF\xE3\x81\xA6\xE3\x81\xAA\xE3\x83\x96\xE3\x83\x83\xE3\x82\xAF\xE3\x83\x9E\xE3\x83\xBC\xE3\x82\xAF\xE3\x81\xB8\xE3\x83\x87\xE3\x83\xBC\xE3\x82\xBF\xE3\x82\x92\xE7\xA7\xBB\xE3\x81\x99"
wordpress_id: 5
wordpress_url: http://tjun.jp/blog/?p=5
date: 2009-07-23 20:45:46 +09:00
---
Firefoxアドオンの使いやすさからこれまでは<a href="http://delicious.com/">delicious</a>を使っていたけど、はてなもfirefoxアドオンを出してなかなか評判がよいみたいなので、移行することにした。

はてぶでは、Deliciousからの移行にも対応と書いてあり、deliciousでエクスポートしたものをそのままインポートするだけでデータが移せるみたい。

まずはdeliciousからエクスポート。

<a href="http://delicious.com/">deliciou</a> の右上settingsの"Export/Backup Bookmarks"から行けます。

次にこれを<a href="http://b.hatena.ne.jp/">はてなブックマーク</a>の設定の"データ管理"からインポート。

<a href="http://www.ideaxidea.com/archives/2009/07/hatenaoya.html/comment-page-1#comment-9331">本当はこれでうまく行くらしい</a>のだけど、自分の場合はブックマークとそれに対するコメントがずれてしまって、またブックマークの一部しかインポートされなかった。
<h3>解決法</h3>
先に解決法から。
deliciousからインポートしたファイルを文字列検索/置換が行えるエディタで開き、
<ol>
	<li>"&lt;DD&gt;" を全て削除</li>
	<li>"&lt;/A&gt;" を "&lt;/A&gt;&lt;/DT&gt;&lt;DD&gt;"で全て置換</li>
	<li>"&lt;DT&gt;" を "&lt;/DD&gt;&lt;DT&gt;"で全て置換</li>
	<li>一番最初と一番最後のhtmlタグがおかしくなるのでそこを修正(一番上エントリの&lt;/DD&gt;を削除し，一番下のエントリの最後に&lt;/DD&gt;をつける</li>
</ol>


こうやって新しくできたhtmファイルをはてなブックマークでimportしてやれば正しく移行されます。

<h3>原因</h3>
deliciousからexportしたhtmファイルのソースと、正しくimportされたはてぶを見比べると、どうもインポートの際にコメントをつけたブックマークの数だけしかインポートが行われず、全てのブックマークにコメントがあるものとしてインポートするから、ブックマークとコメントがずれてしまうみたい。

つまり、

[xml]
&lt;DL&gt;&lt;DT&gt;&lt;A HREF=&quot;http://example.com&quot; LAST_VISIT=&quot;1248093454&quot; ADD_DATE=&quot;1248093454&quot; TAGS=&quot;tag1,tokyo,example&quot;&gt;ブックマークその１&lt;/A&gt;
&lt;DD&gt;コメント１
&lt;DT&gt;&lt;A HREF=&quot;http://www.example01.com/a.html&quot; LAST_VISIT=&quot;1248071261&quot; ADD_DATE=&quot;1248071261&quot; TAGS=&quot;iphone, aaaa, tag2&quot;&gt;ブックマークその２&lt;/A&gt;
&lt;DT&gt;&lt;A HREF=&quot;http://bookmark.com/&quot; LAST_VISIT=&quot;1247826901&quot; ADD_DATE=&quot;1247826901&quot; TAGS=&quot;tag3, blog&quot;&gt;ブックマークその３&lt;/A&gt;
&lt;DD&gt;コメント３
&lt;DT&gt;&lt;A HREF=&quot;http://example.net/2009/aaa.html&quot; LAST_VISIT=&quot;1247763108&quot; ADD_DATE=&quot;1247763108&quot; TAGS=&quot;tag4,database&quot;&gt;bookmark4&lt;/A&gt;
[/xml]
のようなコードがあった場合、ブックマーク１と３にはコメントがあることを意味していて、この場合インポートされるのは
ブックマーク１とコメント１　→　正しい
ブックマーク２とコメント３　→　ずれてる
の２つだけで、コメントもずれてしまう。

上の解決法で、正しくタグを閉じてやるようにすると、正しくインポートされる。

どうも、全てのブックマークにコメントをつけていない限りこの問題が発生する気がする。
はてなの対応が甘いのかもしれないが、deliciousからエクスポートされるコードが正しくないのがそもそもの原因。
