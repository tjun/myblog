---
layout: post
status: publish
published: true
title: ! '[PHP] twitterのRSSからreplyを取り除く'
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1080
wordpress_url: http://tjun.jp/blog/?p=1080
date: 2012-01-08 02:16:23.000000000 +09:00
categories:
- twitter
- php
tags:
- twitter
- php
comments: []
---
twitterのRSSを<a href="http://tjun.jp">自分のウェブページ</a>に表示していたのですが、そのままだとつぶやきもリプライ(mention?)もすべて表示されてしまいます。

なので、正規表現でリプライだけ取り除いて表示するようにしました。
RTはそのまま表示してます。

[php]
require_once 'lib/rss_fetch.inc';

$twit_feed = 'http://twitter.com/statuses/user_timeline/********.rss';
$twit_rss = fetch_rss($twit_feed);

$max = 20;
$cnt = 0;

echo "<ul>";
foreach($twit_rss->items as $item){
  $cnt++;
  if($cnt > $max)break;
  $title = htmlspecialchars($item['title']);
  if(preg_match("/^tjun: @/", $title))continue;
  $url = htmlspecialchars($item['link']);
  echo "  <li><a href=\"$url\">$title</a></li>\n";
}
echo "</ul>";
[/php]

リプライを取り除くのは以下の部分です。
[php]
  if(preg_match("/^tjun: @/", $title))continue;
[/php]
tjunは、自分のtwitterのユーザ名です。先頭が "ユーザ名: @" であれば、リプライと判定してます。


久しぶりにPHP書きました。
一応正しく動いているように見えますが、何か間違ってるかもしれません。
