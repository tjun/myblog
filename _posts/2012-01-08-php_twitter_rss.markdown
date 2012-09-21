--- 
layout: post
title: "[PHP] twitter\xE3\x81\xAERSS\xE3\x81\x8B\xE3\x82\x89reply\xE3\x82\x92\xE5\x8F\x96\xE3\x82\x8A\xE9\x99\xA4\xE3\x81\x8F"
wordpress_id: 1080
wordpress_url: http://tjun.jp/blog/?p=1080
date: 2012-01-08 02:16:23 +09:00
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

echo &quot;&lt;ul&gt;&quot;;
foreach($twit_rss-&gt;items as $item){
  $cnt++;
  if($cnt &gt; $max)break;
  $title = htmlspecialchars($item['title']);
  if(preg_match(&quot;/^tjun: @/&quot;, $title))continue;
  $url = htmlspecialchars($item['link']);
  echo &quot;  &lt;li&gt;&lt;a href=\&quot;$url\&quot;&gt;$title&lt;/a&gt;&lt;/li&gt;\n&quot;;
}
echo &quot;&lt;/ul&gt;&quot;;
[/php]

リプライを取り除くのは以下の部分です。
[php]
  if(preg_match(&quot;/^tjun: @/&quot;, $title))continue;
[/php]
tjunは、自分のtwitterのユーザ名です。先頭が "ユーザ名: @" であれば、リプライと判定してます。


久しぶりにPHP書きました。
一応正しく動いているように見えますが、何か間違ってるかもしれません。
