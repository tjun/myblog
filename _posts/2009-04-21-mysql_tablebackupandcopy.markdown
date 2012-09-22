---
layout: post
status: publish
published: true
title: mysqlのテーブルの保存とコピー
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 308
wordpress_url: http://zzz.jeeet.net/?p=308
date: 2009-04-21 11:35:08.000000000 +09:00
categories:
- db
tags:
- db
- mysql
comments: []
---
たまにやるのにやり方いつも忘れるから自分用にメモ．

テーブルをそのまま別のPCのデータベースに移したいときに使います．
別のやり方もあると思うけど，個人的にはテーブルの作成からやってくれるこの方法が好き．

<pre>mysqldump --u [user_name] --p --database [db_name] --tables [table_name]
> output.sql
</pre>

これでテーブルの内容を，output.sqlというファイルに出力することができます。

ファイルをlessなどで見れば，内容がわかると思います。

これを他のデータベースに挿入するには，
<pre>mysql -u [user_name] -p [db_name] < output.sql</pre>

でOK。


<div style="margin-top: 10px; height: 15px;" class="zemanta-pixie"><img style="border: medium none ; float: right;" class="zemanta-pixie-img" src="http://img.zemanta.com/reblog_e.png?x-id=f67683c2-f534-489c-b4e3-29a2b18de664" alt="Reblog this post [with Zemanta]"><span class="zem-script more-related"><script type="text/javascript" src="http://static.zemanta.com/readside/loader.js" defer="defer"></script></span></div>
