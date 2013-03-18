---
layout: post
status: publish
published: true
title: Deliciousからはてなブックマークへデータを移す
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 5
wordpress_url: http://tjun.jp/blog/?p=5
date: 2009-07-23 20:45:46.000000000 +09:00
categories:
- web
tags:
- webservice
- はてな
comments: []
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
	<li>"<DD>" を全て削除</li>
	<li>"</A>" を "</A></DT><DD>"で全て置換</li>
	<li>"<DT>" を "</DD><DT>"で全て置換</li>
	<li>一番最初と一番最後のhtmlタグがおかしくなるのでそこを修正(一番上エントリの</DD>を削除し，一番下のエントリの最後に</DD>をつける</li>
</ol>


こうやって新しくできたhtmファイルをはてなブックマークでimportしてやれば正しく移行されます。

<h3>原因</h3>
deliciousからexportしたhtmファイルのソースと、正しくimportされたはてぶを見比べると、どうもインポートの際にコメントをつけたブックマークの数だけしかインポートが行われず、全てのブックマークにコメントがあるものとしてインポートするから、ブックマークとコメントがずれてしまうみたい。

つまり、

[xml]
<DL><DT><A HREF="http://example.com" LAST_VISIT="1248093454" ADD_DATE="1248093454" TAGS="tag1,tokyo,example">ブックマークその１</A>
<DD>コメント１
<DT><A HREF="http://www.example01.com/a.html" LAST_VISIT="1248071261" ADD_DATE="1248071261" TAGS="iphone, aaaa, tag2">ブックマークその２</A>
<DT><A HREF="http://bookmark.com/" LAST_VISIT="1247826901" ADD_DATE="1247826901" TAGS="tag3, blog">ブックマークその３</A>
<DD>コメント３
<DT><A HREF="http://example.net/2009/aaa.html" LAST_VISIT="1247763108" ADD_DATE="1247763108" TAGS="tag4,database">bookmark4</A>
[/xml]
のようなコードがあった場合、ブックマーク１と３にはコメントがあることを意味していて、この場合インポートされるのは
ブックマーク１とコメント１　&rarr;　正しい
ブックマーク２とコメント３　&rarr;　ずれてる
の２つだけで、コメントもずれてしまう。

上の解決法で、正しくタグを閉じてやるようにすると、正しくインポートされる。

どうも、全てのブックマークにコメントをつけていない限りこの問題が発生する気がする。
はてなの対応が甘いのかもしれないが、deliciousからエクスポートされるコードが正しくないのがそもそもの原因。
