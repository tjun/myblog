--- 
layout: post
title: ".htaccess\xE3\x81\xA7\xE3\x81\xAEBasic\xE8\xAA\x8D\xE8\xA8\xBC\xE3\x81\xAE\xE3\x83\xA6\xE3\x83\xBC\xE3\x82\xB6\xE5\x90\x8D\xE3\x82\x92php\xE3\x81\xA7\xE5\x8F\x96\xE5\xBE\x97"
wordpress_id: 391
wordpress_url: http://zzz.jeeet.net/?p=138
date: 2008-10-31 14:34:04 +09:00
---
phpでのBasic認証ではなく，.htaccessを用いたBasic認証をした際のユーザ名は，phpを用いると
<pre>
$_SERVER['REMOTE_USER']
</pre>
で取得できます．
phpでのBasic認証の場合は，
<pre>
$_SERVER['PHP_AUTH_USER']
</pre>
です．
<br />
